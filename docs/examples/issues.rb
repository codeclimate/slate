#!/usr/bin/env ruby

## Usage: ./issues.rb REPO_ID [BRANCH]
#
# Outputs CSV formatted list of all issues from most recent snapshot
# of the repo specified. Pipe STDOUT to a file to save to a file.
#
# Branch defaults to "master" if not specified.
#
# e.g. ./issues.rb 5017075af3ea000dc6000740
# e.g. ./issues.rb 5017075af3ea000dc6000740 development
#
# # Installation:
#
# 1. Install dependencies
#
# This script uses two dependencies which can be installed with bundler:
# $ bundle install
#
# 2. Create .env file
#
# Copy .env.example to .env and change the variables as appropriate for your
# environment
#
# If you are a Code Climate Enterprise user, you CODECLIMATE_URL should look like:
# CODECLIMATE_URL=https://your-url.com/api
#
# A token for use with the API can be generated here (similar URL for CC:E):
#
# https://codeclimate.com/profile/tokens/new

require "dotenv"
require "net/http"
require "json"
require "csv"
require "active_support/core_ext/hash"

Dotenv.load

class CodeClimateRequest
  def initialize
    @base_uri = ENV["CODECLIMATE_URL"]
  end

  def request(path)
    uri = URI("#{@base_uri}#{path}")
    if ENV["DEBUG"] == "1"
      STDERR.puts uri.to_s
    end
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = uri.scheme == "https" ? true : false
    request = Net::HTTP::Get.new(uri.request_uri)
    request.set_content_type("application/vnd.api+json")
    request["Authorization"] = "Token token=#{ENV["CODECLIMATE_API_TOKEN"]}"
    http.request(request)
  end
end

repo_id = ARGV[0]
branch_name = ARGV[1] || "master"

query = {
  "page[size]" => 1,
  "filter[branch]" => branch_name,
  "filter[analyzed]" => true,
}

path = "/v1/repos/#{repo_id}/ref_points?#{query.to_query}"

response = CodeClimateRequest.new.request(path)
if response.code == "200"
  ref_point = JSON.parse(response.body)
  if ref_point["data"].size > 0
    snapshot_id = ref_point["data"].first["relationships"]["snapshot"]["data"]["id"]

    if ENV["DEBUG"] == "1"
      path = "/v1/repos/#{repo_id}/snapshots/#{snapshot_id}"
      response = CodeClimateRequest.new.request(path)
      commit_sha = JSON.parse(response.body)["data"]["attributes"]["commit_sha"]
      STDERR.puts "DEBUG (stderr) -- repo: #{repo_id}, branch: #{branch_name}, sha: #{commit_sha}"
    end

    page_number = 1
    query = {
      "page[number]" => page_number
    }
    issues = nil
    csv = CSV.new(STDOUT)
    csv << ["File", "Remediation Points", "Issue"]
    while issues.nil? || issues.size > 0
      query["page[number]"] = page_number
      path = "/v1/repos/#{repo_id}/snapshots/#{snapshot_id}/issues?#{query.to_query}"
      response = CodeClimateRequest.new.request(path)
      issues = JSON.parse(response.body)["data"]
      issues.each do |issue|
         csv << [issue["attributes"]["location"]["path"], issue["attributes"]["remediation_points"], issue["attributes"]["check_name"]]
      end
      page_number += 1
    end
  else
    puts "Could not find any ref points for branch \"#{branch_name}\" and repo \"#{repo_id}\""
    exit(1)
  end
else
  puts "Uh oh, something went wrong. Response code was #{response.code}"
  puts response.body if response.body
  exit(1)
end
