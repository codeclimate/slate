# Repository Analysis

## Get issues

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "page[size]=3" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/snapshots/596922dbbf0ade0001004b87/issues
```

> JSON response:

```json
{
  "data": [
    {
      "id": "59692f9909bf630001000046",
      "type": "issues",
      "attributes": {
        "categories": [
          "Complexity"
        ],
        "check_name": "method_count",
        "constant_name": "lib\/book.rb",
        "content": {
          "body": ""
        },
        "description": "Class `Check` has 22 methods (exceeds 20 allowed). Consider refactoring.",
        "engine_name": "structure",
        "fingerprint": "15447258442b0314aa1543ec0eced333",
        "location": {
          "path": "lib\/book.rb",
          "end_line": 205,
          "start_line": 7
        },
        "other_locations": [

        ],
        "remediation_points": 1400000,
        "severity": "minor"
      },
      "meta": {
        "permissions": {
          "manageable": true
        }
      }
    },
    {
      "id": "59692f9c09bf630001000060",
      "type": "issues",
      "attributes": {
        "categories": [
          "Style"
        ],
        "check_name": "Rubocop\/Style\/WordArray",
        "constant_name": "lib\/book.rb",
        "content": {
          "body": "This cop can check for array literals made up of word-like\nstrings, that are not using the %w() syntax.\n\nAlternatively, it can check for uses of the %w() syntax, in projects\nwhich do not want to include that syntax."
        },
        "description": "Use `%w` or `%W` for an array of words.",
        "engine_name": "rubocop",
        "fingerprint": "f506a038288d1d6b9dab5f7bcc3528dd",
        "location": {
          "path": "lib\/book.rb",
          "end_line": 31,
          "start_line": 31
        },
        "other_locations": [

        ],
        "remediation_points": 50000,
        "severity": "minor",
        "status": {
          "details": "",
          "name": "invalid",
          "updated_at": "2017-07-11T22:04:32.145Z",
          "updated_by_id": "57ae4e45a41eb700640014ec"
        }
      },
      "meta": {
        "permissions": {
          "manageable": true
        }
      }
    },
    {
      "id": "59692f9c09bf63000100005d",
      "type": "issues",
      "attributes": {
        "categories": [
          "Style"
        ],
        "check_name": "Rubocop\/Style\/MethodName",
        "constant_name": "lib\/book.rb",
        "content": {
          "body": "This cop makes sure that all methods use the configured style,\nsnake_case or camelCase, for their names. Some special arrangements\nhave to be made for operator methods."
        },
        "description": "Use snake_case for method names.",
        "engine_name": "rubocop",
        "fingerprint": "6a6479b6d3d525ad5a6543fc076b1711",
        "location": {
          "path": "lib\/book.rb",
          "end_line": 11,
          "start_line": 11
        },
        "other_locations": [

        ],
        "remediation_points": 50000,
        "severity": "minor",
        "status": {
          "details": "",
          "name": "invalid",
          "updated_at": "2017-07-11T22:03:30.320Z",
          "updated_by_id": "57ae4e45a41eb700640014ec"
        }
      },
      "meta": {
        "permissions": {
          "manageable": true
        }
      }
    }
  ],
  "links": {
    "self": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/snapshots\/596922dbbf0ade0001004b87\/issues?page%5Bnumber%5D=1&page%5Bsize%5D=3",
    "next": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/snapshots\/596922dbbf0ade0001004b87\/issues?page%5Bnumber%5D=2&page%5Bsize%5D=3",
    "last": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/snapshots\/596922dbbf0ade0001004b87\/issues?page%5Bnumber%5D=9&page%5Bsize%5D=3"
  },
  "meta": {
    "current_page": 1,
    "total_pages": 9,
    "total_count": 25
  }
}
```

Returns a paginated collection of analysis issues found by the snapshot. Each issue
found includes its status ("invalid", "won't fix" etc), location, fingerprint, severity and other details.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/snapshots/:snapshot_id/issues`

### Query Parameters

[Paginated](#collection-pagination), [Filterable](#collection-filtering), Sortable

Filters include:

| Name | Description | Required? |
| ---- | ----------- | --------- |
| filter[categories] | Single path or `$in` clause containing list of categories | No |
| filter[severity] | Single severity or `$in` clause containing list of severities | No |
| filter[status] | Single status or `$in` clause containing list of statuses | No |
| filter[location.path] | Single path or `$in` clause containing list of statuses | No |

## Get files

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "page[size]=3" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/snapshots/596922dbbf0ade0001004b87/files
```

> JSON response:

```json
{
  "data": [
    {
      "id": "59692f9709bf630001000004",
      "type": "constants",
      "attributes": {
        "blob_id": "c101538850228bcb9a91916ce1ce33fe34a75658",
        "path": "lib/book.rb",
        "rating": null
      }
    },
    {
      "id": "59692f9709bf630001000043",
      "type": "constants",
      "attributes": {
        "blob_id": "19e1f6c863dca39b1724b0007fbc8b3564411a14",
        "path": "lib/group.rb",
        "rating": null
      }
    },
    {
      "id": "59692f9709bf630001000022",
      "type": "constants",
      "attributes": {
        "blob_id": "e1166417d88ba5dad15a47564146a68ac3c50222",
        "path": "lib/user.rb",
        "rating": null
      }
    }
  ],
  "links": {
    "self": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/snapshots\/596922dbbf0ade0001004b87\/files?page%5Bnumber%5D=1&page%5Bsize%5D=3",
    "next": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/snapshots\/596922dbbf0ade0001004b87\/files?page%5Bnumber%5D=2&page%5Bsize%5D=3",
    "last": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/snapshots\/596922dbbf0ade0001004b87\/files?page%5Bnumber%5D=20&page%5Bsize%5D=3"
  }
}
```

Retrieve analysis of files associated with a given snapshot.

Sorted by path in ascending order.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/snapshots/:snapshot_id/files`

### Query Parameters

[Paginated](#collection-pagination)

## Get builds

> Running builds:

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "filter[state]=running" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/builds
```

> JSON response:

```json
{
  "data": [
    {
      "id": "584ec7bb46607e0001004eda",
      "type": "builds",
      "attributes": {
        "commit_sha": "42d2908f95610fd1ae429bbb7f4b09e50dbd0672",
        "error_code": null,
        "finished_at": null,
        "local_ref": "refs\/pull\/3302\/head",
        "number": 6723,
        "state": "running"
      },
      "relationships": {
        "pull_request": {
          "data": {
            "id": "584ec7bad211e6000103444e",
            "type": "pull_requests"
          }
        },
        "snapshot": {
          "data": null
        }
      },
      "links": {
        "self": "https:\/\/codeclimate.com\/repos\/5017075af3ea000dc6000740\/builds\/6723"
      }
    },
    {
      "id": "56af8a388542010001002d11",
      "type": "builds",
      "attributes": {
        "commit_sha": "5c44e9a9e70c17133b9f7473dd57b08eb91b111d",
        "error_code": null,
        "finished_at": null,
        "local_ref": "refs\/pull\/2124\/head",
        "number": 1624,
        "state": "running"
      },
      "relationships": {
        "pull_request": {
          "data": {
            "id": "56abdbcf8fdd16000103b200",
            "type": "pull_requests"
          }
        },
        "snapshot": {
          "data": null
        }
      },
      "links": {
        "self": "https:\/\/codeclimate.com\/repos\/696a76232df2736347000001\/builds\/1624"
      }
    }
  ],
  "links": {

  }
}
```

Returns collection of builds for the repository, sorted in descending order by build number.

Builds represent an attempt to run analysis on a particular commit of a repository.
Builds may not have started or finished, or finished successfully.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/builds`

### Query Parameters

[Paginated](#collection-pagination), [Filterable](#collection-filtering)

Filters include:

| Name | Description | Required? |
| ---- | ----------- | --------- |
| filter[state] | Only builds in a particular state. Supports the states `new` or `running` | No |
| filter[local_ref] | Only builds associated with the given `local_ref`. Examples include `refs/pulls/553/head` and `ref/heads/master` | No |

## Get build

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/builds/10678
```

> JSON response:

```json
{
  "data": {
    "id": "596922dccf0ade0001004b98",
    "type": "builds",
    "attributes": {
      "commit_sha": "db36165a645accc5ac78d3c70dffffa4aef7d8a2",
      "error_code": null,
      "finished_at": "2017-07-14T20:03:14.050Z",
      "local_ref": "refs\/heads\/master",
      "number": 10678,
      "state": "complete"
    },
    "relationships": {
      "pull_request": {
        "data": null
      },
      "snapshot": {
        "data": {
          "id": "596922dbbf0ade0001004b87",
          "type": "snapshots"
        }
      }
    },
    "links": {
      "self": "https:\/\/codeclimate.com\/repos\/696a76232df2736347000001\/builds\/10678"
    }
  }
}
```

A build represent an attempt to run analysis on a particular commit of a repository.
Builds may not have started or finished, or finished successfully.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/builds/:number`

### Query Parameters

N/A

## Get snapshot

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/snapshots/596922dbbf0ade0001004b87
```

> JSON response:

```json
{
  "data": {
    "id": "596922dbbf0ade0001004b87",
    "type": "snapshots",
    "attributes": {
      "commit_sha": "db36165a645accc5ac78d3c70dffffa4aef7d8a2",
      "committed_at": "2017-07-14T20:00:26.765Z",
      "created_at": "2017-07-14T20:03:14.042Z",
      "lines_of_code": 456,
      "ratings": [
        {
          "letter": "A",
          "path": "\/",
          "measure": {
            "value": 3.0210800735343,
            "unit": "percent"
          },
          "pillar": "Maintainability"
        }
      ],
      "gpa": null,
      "worker_version": 33840
    },
    "meta": {
      "issues_count": 6037,
      "measures": {
        "remediation": {
          "value": 20007.3,
          "unit": "minute"
        },
        "technical_debt_ratio": {
          "value": 3.0210800735343,
          "unit": "percent"
        }
      }
    }
  }
}
```

Retrieves information associated with a given snapshot.

A snapshot represents a successful completed analysis of a specific commit.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/snapshots/:snapshot_id`

### Query Parameters

N/A

## Get time series

> Retrieves the number of files rated with an `A` each week between `2017-04-01` and `2017-05-01`.

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get
  --data-urlencode "filter[from]=2017-04-01"
  --data-urlencode "filter[to]=2017-05-01"
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/metrics/ratings.A
```

> JSON response. `points` is an array of data points each containing a `timestamp` and `value`.

```json
{
  "data": {
    "id": "58b05f886d9cd4bb01000123",
    "type": "metrics",
    "attributes": {
      "name": "ratings.A",
      "points": [
        {
          "timestamp": 1490572800,
          "value": 1398
        },
        {
          "timestamp": 1491177600,
          "value": 1387
        },
        {
          "timestamp": 1491782400,
          "value": 1389
        },
        {
          "timestamp": 1492387200,
          "value": 1389
        },
        {
          "timestamp": 1492992000,
          "value": 1389
        },
        {
          "timestamp": 1493596800,
          "value": 1392
        }
      ]
    }
  }
}
```

Returns information about a particular repository metric as a time series. The time
series returned is an array of data points, each containing a `timestamp` and a `value`
for the metric at that `timestamp`. A range of time is required, provided by
passing query parameters `filter[to]` and `filter[from]`.

Currently, data points are captured and returned in weekly increments only. The timestamp
for a particular data point represents the start of that time period.

<aside class="notice">
The timestamps returned in this API endpoint are UnixEpochs, which differs from the
timestamp format used elsewhere in the API.
</aside>

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/metrics/:metric`

`:metric` can take one of the following values:

| Metric | Description |
| ------ | ----------- |
| gpa    | Grade point average of repository |
| ratings.A | Number of files with an `A` rating |
| ratings.B | Number of files with a `B` rating |
| ratings.C | Number of files with a `C` rating |
| ratings.D | Number of files with a `D` rating |
| ratings.F | Number of files with an `F` rating |

### Query Parameters

[Paginated](#collection-pagination), [Filterable](#collection-filtering)

Filters include:

| Name | Description | Required? |
| ---- | ----------- | --------- |
| filter[from] | Start date of time series range, in `YYYY-MM-DD` format | Yes |
| filter[to] | End date of time series range, in `YYYY-MM-DD` format | Yes |
