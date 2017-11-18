# Repositories

## Get repository

> Retrieve a repo by github_slug:

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/repos?github_slug=twinpeaks/ranchorosa
```

> Alternatively, if you know the repo_id, you can issue the following:

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001
```

> JSON response:

```json
{
  "data": [
    {
      "id": "696a76232df2736347000001",
      "type": "repos",
      "attributes": {
        "analysis_version": 3385,
        "badge_token": "16096d266f46b7c68dd4",
        "branch": "master",
        "created_at": "2017-07-15T20:08:03.732Z",
        "github_slug": "twinpeaks\/ranchorosa",
        "human_name": "ranchorosa",
        "last_activity_at": "2017-07-15T20:09:41.846Z",
        "score": 1.36
      },
      "relationships": {
        "latest_default_branch_snapshot": {
          "data": {
            "id": "596a762c9373ca000100177e",
            "type": "snapshots"
          }
        },
        "latest_default_branch_test_report": {
          "data": null
        },
        "account": {
          "data": {
            "id": "596b70adb79d8f147b000002",
            "type": "orgs"
          }
        }
      },
      "links": {
        "self": "https:\/\/codeclimate.com\/repos\/696a76232df2736347000001",
        "services": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/services",
        "web_coverage": "https:\/\/codeclimate.com\/repos\/696a76232df2736347000001\/coverage",
        "web_issues": "https:\/\/codeclimate.com\/repos\/696a76232df2736347000001\/issues"
      },
      "meta": {
        "permissions": {
          "admin": true
        }
      }
    }
  ]
}
```

Retrieves information about the specified repository.

### HTTP Request

`GET http://api.codeclimate.com/v1/repos?github_slug={github_slug}`

_OR_

`GET http://api.codeclimate.com/v1/repos/:repo_id`

### Query Parameters

| Parameter | Description | Required? |
| --------- | ----------- | --------- |
| github_slug       | GitHub slug in `username/reponame` format | Yes if no `:repo_id` |

## Get ref points

> First page of ref points, for master branch only, which have completed Code Climate analysis.

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "filter[branch]=master" \
  --data-urlencode "filter[analyzed]=true" \
  --data-urlencode "page[size]=3" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/ref_points
```

> JSON response:

```json
{
  "data": [
    {
      "id": "596922da59abfc0001000170",
      "type": "ref_points",
      "attributes": {
        "analyzed": true,
        "branch": "master",
        "commit_sha": "db36165a645dccb5ac78d3c70dffffa4aef7d8a2",
        "created_at": "2017-07-14T20:00:26.765Z",
        "ref": "refs\/heads\/master"
      },
      "relationships": {
        "snapshot": {
          "data": {
            "id": "596922dbbf0ade0001004b86",
            "type": "snapshots"
          }
        }
      }
    },
    {
      "id": "59691c63f4c69a0002001026",
      "type": "ref_points",
      "attributes": {
        "analyzed": true,
        "branch": "master",
        "commit_sha": "e9a210203b43d1586ca1aa27884c86b914419bff",
        "created_at": "2017-07-14T19:32:51.664Z",
        "ref": "refs\/heads\/master"
      },
      "relationships": {
        "snapshot": {
          "data": {
            "id": "60691c63bf0ade00010042c7",
            "type": "snapshots"
          }
        }
      }
    },
    {
      "id": "6068ee85ce77bd0001000029",
      "type": "ref_points",
      "attributes": {
        "analyzed": true,
        "branch": "master",
        "commit_sha": "6b21824ec86477884482b51284267af8dcfec233",
        "created_at": "2017-07-14T16:17:09.936Z",
        "ref": "refs\/heads\/master"
      },
      "relationships": {
        "snapshot": {
          "data": {
            "id": "59744a9dbf0ade0001003fa3",
            "type": "snapshots"
          }
        }
      }
    }
  ],
  "links": {
    "self": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/ref_points?filter%5Banalyzed%5D=true&filter%5Bbranch%5D=master&page%5Bnumber%5D=1&page%5Bsize%5D=3",
    "next": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/ref_points?filter%5Banalyzed%5D=true&filter%5Bbranch%5D=master&page%5Bnumber%5D=2&page%5Bsize%5D=3",
    "last": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/ref_points?filter%5Banalyzed%5D=true&filter%5Bbranch%5D=master&page%5Bnumber%5D=1760&page%5Bsize%5D=3"
  }
}
```

Returns collection of ref points for the repository.

A ref point is an observation of a commit on a branch at a moment in time. Whenever Code Climate is notified about a new commit (e.g. through webhook events), Code Climate create a ref point for it. It's sort of like our own git log of the actions that occurred on the repository and won't change if you force-push and change history.

Ref points are sorted by creation date in reverse chronological order.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/ref_points`

### Query Parameters

[Paginated](#collection-pagination), [Filterable](#collection-filtering)

Filters include:

| Name | Description | Required? |
| ---- | ----------- | --------- |
| filter[analyzed] | Only ref points which have been analyzed (or not analyzed) by Code Climate | No |
| filter[branch] | Only ref points associated with the specified `branch` | No |
| filter[commit_sha] | Only ref points associated with the given `commit_sha` | No |
| filter[local_ref] | Only ref points associated with the given `local_ref`. Examples include `refs/pulls/553/head` and `ref/heads/master` | No |

## Get repository services

```shell
curl
  -H "Accept: application/vnd.api+json"
  -H "Authorization: Token token={TOKEN}"
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/services
```

> JSON response:

```json
{
  "data": [
    {
      "id": "58f0ee6f2f1eba0290004322",
      "type": "services",
      "attributes": {
        "slug": "flowdock",
        "title": "Flowdock",
        "description": "Send messages to a Flowdock inbox"
      },
      "links": {
        "events": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/services\/58f0ee6f2f1eba0290004322\/events"
      }
    },
    {
      "id": "53c97739e30ba123fd00abd3",
      "type": "services",
      "attributes": {
        "slug": "githubpullrequests",
        "title": "GitHub Pull Requests",
        "description": "Update pull requests on GitHub"
      },
      "links": {
        "events": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/services\/53c97739e30ba123fd00abd3\/events"
      }
    },
    {
      "id": "8953edc0e30ba06dfd0017d3",
      "type": "services",
      "attributes": {
        "slug": "hipchat",
        "title": "HipChat",
        "description": "Send messages to a HipChat chat room"
      },
      "links": {
        "events": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/services\/8953edc0e30ba06dfd0017d3\/events"
      }
    },
    {
      "id": "22272d8e6afbed290a0000eb",
      "type": "services",
      "attributes": {
        "slug": "jira",
        "title": "JIRA",
        "description": "Create tickets in JIRA"
      },
      "links": {
        "events": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/services\/22272d8e6afbed290a0000eb\/events"
      }
    },
    {
      "id": "666958c7695680518a002624",
      "type": "services",
      "attributes": {
        "slug": "slack",
        "title": "Slack",
        "description": "Send messages to a Slack channel"
      },
      "links": {
        "events": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/services\/666958c7695680518a002624\/events"
      }
    }
  ]
}
```

Returns a collection of (external) service integrations for a particular repository.

There are few types of integrations:

* Issue tracker
* Chat service
* Pull requests

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/services`

### Query Parameters

[Filterable](#collection-filtering)

Filters include:

| Name | Description | Required? |
| ---- | ----------- | --------- |
| filter[type] | Only integrations of this type. Only supports `issue_tracker` value at the moment. | No |

## Trigger new service event

> Given a JSON file "trigger-event.json" with the following contents ...

```json
{
  "data": {
    "attributes": {
      "name": "issue",
      "issue": {
        "check_name": "Metrics/CyclomaticComplexity",
        "description": "Cyclomatic complexity for method is too high.",
        "details_url": "http://example.com/repos/1/issues#issue_12345",
        "id": "12345",
        "location": {
          "path": "foo.rb"
        }
      }
    }
  }
}
```

> ... issue the following after replacing {TOKEN} ...

```shell
$ curl \
  -H "Accept: application/vnd.api+json" \
  -H "Content-Type: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  -d @trigger-event.json \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/services/666958c7695680518a002624/events
```

> ... which returns JSON like this:

```json
{
  "data": {
    "attributes": {
      "ok": true,
      "message": "Success"
    },
    "id": "700a76232df2736347000201",
    "type": "service_events",
    "links": {
      "external": "https://github.com/example/repo/issues/100"
    }
  }
}
```

Trigger an event to be consumed by one of the repository's service integrations.

### HTTP Request

`POST https://api.codeclimate.com/v1/repos/:repo_id/services/:service_id/events`

### POST Parameters

Request is a JSON API document which complies with the specification for
resource creation requests. See example POST in gutter for format.

For more details, consult [Creating Resources](http://jsonapi.org/format/#crud-creating).

## Add public (OSS) repository

> Given a JSON file "create-public-repository.json" with the following contents ...

```json
{
  "data": {
    "type": "repos",
    "attributes": {
      "url": "https://github.com/twinpeaks/ranchorosa"
    }
  }
}
```

> .. issue the following after replacing {TOKEN} and the organization id ...

```shell
$ curl \
  -H "Accept: application/vnd.api+json" \
  -H "Content-Type: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  -d @create-public-repository.json \
  https://api.codeclimate.com/v1/github/repos
```

> ... which returns JSON like this:

```json
{
  "data": {
    "id": "5977b29ed9371b0266334433",
    "type": "repos",
    "attributes": {
      "analysis_version": 3436,
      "badge_token": "a5bf2eef77b257ea5bb8",
      "branch": "master",
      "created_at": "2017-07-25T21:05:34.827Z",
      "github_slug": "twinpeaks\/ranchorosa",
      "human_name": "brew",
      "last_activity_at": "2017-07-25T21:05:34.827Z",
      "score": null
    },
    "relationships": {
      "latest_default_branch_snapshot": {
        "data": null
      },
      "latest_default_branch_test_report": {
        "data": null
      },
      "account": {
        "data": null
      }
    },
    "links": {
      "self": "https:\/\/codeclimate.com\/github\/twinpeaks\/ranchorosa",
      "services": "https:\/\/api.codeclimate.com\/v1\/repos\/5977b29ed9371b0266334433\/services",
      "web_coverage": "https:\/\/codeclimate.com\/github\/twinpeaks\/ranchorosa\/coverage",
      "web_issues": "https:\/\/codeclimate.com\/github\/twinpeaks\/ranchorosa\/issues"
    },
    "meta": {
      "permissions": {
        "admin": true
      }
    }
  }
}
```

Add a GitHub open source repository to Code Climate

If the repository was added successfully, this endpoint responds with the
added repository and status `201`.

### HTTP Request

`POST http://api.codeclimate.com/v1/github/repos`

### POST Parameters

Request is a JSON API document which complies with the specification for
resource creation requests. See example POST in gutter for format.

For more details, consult [Creating Resources](http://jsonapi.org/format/#crud-creating).

| Parameter | Description | Required? |
| --------- | ----------- | --------- |
| url       | Code Climate uses the `url` parameter to determine where your repository is hosted and how to clone it. Currently, only repositories hosted on GitHub are supported, so we only accept `https://github.com` URLs. Once created, users will still find a Deploy Key added on GitHub and an SSH-based clone URL in their repo settings. | Yes |
