#!/usr/bin/env ruby

## Usage: ./directory-coverage.rb REPO_ID [path-1] [path-2] [path-3]
#
# Outputs current coverage percentage of passed directories
#
# e.g. ./directory-coverage.rb 5017075af3ea000dc6000740 app/models app/controllers
#
# # Installation:
#
# 1. Install script's dependencies
#
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
    STDERR.puts "GET #{uri.to_s}" if ENV["DEBUG"] == "1"
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = uri.scheme == "https" ? true : false
    request = Net::HTTP::Get.new(uri.request_uri)
    request.set_content_type("application/vnd.api+json")
    request["Authorization"] = "Token token=#{ENV["CODECLIMATE_API_TOKEN"]}"
    http.request(request)
  end
end

repo_id = ARGV.shift
paths = ARGV
STDERR.puts "Getting test coverage for: #{paths.join(",")}"

path_uri = "/v1/repos/#{repo_id}"

response = CodeClimateRequest.new.request(path_uri)
if response.code == "200"
  repo = JSON.parse(response.body)
  if test_report = repo["data"]["relationships"]["latest_default_branch_test_report"]["data"]
    test_report_id = test_report["id"]
    coverage = {}
    paths.each do |path|
      coverage[path] = { covered: 0, total: 0 }
    end

    page_number = 1
    query = {
      "page[number]" => page_number
    }
    test_file_reports = nil
    while test_file_reports.nil? || test_file_reports.size > 0
      query["page[number]"] = page_number
      path_uri = "/v1/repos/#{repo_id}/test_reports/#{test_report_id}/test_file_reports?#{query.to_query}"
      response = CodeClimateRequest.new.request(path_uri)
      test_file_reports = JSON.parse(response.body)["data"]
      test_file_reports.each do |test_file_report|
        paths.select do |path|
          test_file_report["attributes"]["path"].start_with?(path)
        end.each do |path|
          coverage[path][:covered] += test_file_report["attributes"]["line_counts"]["covered"]
          coverage[path][:total] += test_file_report["attributes"]["line_counts"]["total"]
        end
      end
      page_number += 1
    end

    paths.each do |path|
      percentage_coverage = (coverage[path][:covered] / coverage[path][:total].to_f) * 100
      puts "Coverage for #{path}: #{percentage_coverage.round(2)}%"
    end

  else
    puts "No coverage reports found."
  end
else
  puts "Uh oh, something went wrong. Response code was #{response.code}"
  puts response.body if response.body
  exit(1)
end
