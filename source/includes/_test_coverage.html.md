# Test Coverage

## Get test coverage reports

```shell
curl
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "page[size]=3" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/test_reports
```

> JSON response

```json
{
  "data": [
    {
      "id": "596ad7629c5b3756bc000003",
      "type": "test_reports",
      "attributes": {
        "branch": "master",
        "commit_sha": "cd3811626d5f723130417735d10a132f285795cc",
        "committed_at": "2017-07-16T02:55:52.000Z",
        "covered_percent": 84.946657957762,
        "rating": {
          "path": "\/",
          "letter": "B",
          "measure": {
            "value": 84.946657957762,
            "unit": "percent"
          },
          "pillar": "Test Coverage"
        },
        "received_at": "2018-09-06T20:25:28.098Z",
        "state": "done"
      }
    },
    {
      "id": "596ad4e7e13a1a079100000f",
      "type": "test_reports",
      "attributes": {
        "branch": "master",
        "commit_sha": "a06a461bd0659d733073024434c952445fa4ba77",
        "committed_at": "2017-07-16T02:36:27.000Z",
        "covered_percent": 84.946657957762,
        "rating": {
          "path": "\/",
          "letter": "B",
          "measure": {
            "value": 84.946657957762,
            "unit": "percent"
          },
          "pillar": "Test Coverage"
        },
        "received_at": "2018-09-05T20:25:28.098Z",
        "state": "done"
      }
    },
    {
      "id": "5969249a7834e60266000001",
      "type": "test_reports",
      "attributes": {
        "branch": "master",
        "commit_sha": "db36165a645abbb5ac78d3c70dffffa4aef7d832",
        "committed_at": "2017-07-14T20:00:24.000Z",
        "covered_percent": 84.9460024386,
        "rating": {
          "path": "\/",
          "letter": "B",
          "measure": {
            "value": 84.9460024386,
            "unit": "percent"
          },
          "pillar": "Test Coverage"
        },
        "received_at": "2018-09-04T20:25:28.098Z",
        "state": "done"
      }
    }
  ],
  "links": {
    "self": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/test_reports?page%5Bnumber%5D=1&page%5Bsize%5D=3",
    "next": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/test_reports?page%5Bnumber%5D=2&page%5Bsize%5D=3",
    "last": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/test_reports?page%5Bnumber%5D=163&page%5Bsize%5D=3"
  }
}
```

Gets collection of test coverage reports, sorted by committed at descending.

Each test coverage report contains the overall coverage percentage and test coverage rating
for the repository at a specific commit. Does not contain line by line coverage: line
by line coverage is available via the test file reports endpoint.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/test_reports`

### Query Parameters

[Paginated](#collection-pagination)

## Get test coverage file reports

```shell
curl
  -H "Accept: application/vnd.api+json"
  -H "Authorization: Token token={TOKEN}"
  --get
  --data-urlencode "page[size]=3"
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/test_reports/596ad7629c5b3756bc000003/test_file_reports
```

```json
{
  "data": [
    {
      "id": "596ad7622df1731de500015e",
      "type": "test_file_reports",
      "attributes": {
        "coverage": [4, 4, 4, 4, null, 4, null, 4, 6, 2, null, 2, null, null, null, 1, null, null, 1, null, null, 4, 6, 3, null, 3, null, 3, 2, 2, null, 1, null, null, null, 4, null, 4, 6, null, null, 4, null, null, 3, null, null, 4, 2, 2, 2, null, 2, null, null, null, null, null, null, 4, 2, 1, null, 1, null, null, null, null],
        "covered_percent": 100,
        "covered_strength": 3.0606060606061,
        "path": "lib\/book.rb",
        "line_counts": {
          "missed": 0,
          "covered": 33,
          "total": 33
        }
      }
    },
    {
      "id": "596ad7622df1731de5000147",
      "type": "test_file_reports",
      "attributes": {
        "coverage": [4, 4, 4, null, 4, null, 4, 12, 5, null, 5, 1, null, null, 4, 1, null, null, 3, 1, null, null, 2, 2, null, null, 4, null, 4, 1, 1, null, null, 4, 1, null, null, null, null, null, 4, 1, null, null, null, null, null, 4, 2, null, 2, null, null, null, 4, 24, null, null, 4, 1, 1, null, null, null, null, 1, null, null, 4, 5, null, null, null],
        "covered_percent": 100,
        "covered_strength": 3.7647058823529,
        "path": "lib\/group.rb",
        "line_counts": {
          "missed": 0,
          "covered": 34,
          "total": 34
        }
      }
    },
    {
      "id": "596ad762e13a1a6a9d0000a8",
      "type": "test_file_reports",
      "attributes": {
        "coverage": [4, 4, 4, null, 4, null, 4, 4, 6, null, 2, null, null, null],
        "covered_percent": 100,
        "covered_strength": 4,
        "path": "lib\/user.rb",
        "line_counts": {
          "missed": 0,
          "covered": 8,
          "total": 8
        }
      }
    }
  ],
  "links": {
    "self": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/test_reports\/596ad7629c5b3756bc000003\/test_file_reports?page%5Bnumber%5D=1&page%5Bsize%5D=3",
    "next": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/test_reports\/596ad7629c5b3756bc000003\/test_file_reports?page%5Bnumber%5D=2&page%5Bsize%5D=3",
    "last": "https:\/\/api.codeclimate.com\/v1\/repos\/696a76232df2736347000001\/test_reports\/596ad7629c5b3756bc000003\/test_file_reports?page%5Bnumber%5D=307&page%5Bsize%5D=3"
  }
}
```

Gets collection of test coverage file reports, containing line by line coverage information.

The coverage attribute contains an array of coverage information. `null` in the array means that line is "uncoverable" (e.g. blank line or comment), a number in the array represents how many times that line was covered by tests.

Sorted by file paths in ascending order.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/test_reports/:test_report_id/test_file_reports`

### Query Parameters

[Paginated](#collection-pagination)

## Sending test coverage data

While the API also supports receiving test coverage data from your build, we generally do not recommend issuing calls against these endpoints yourself and as such have not documented them.

Instead, we recommend that you use [our test reporter client](https://github.com/codeclimate/test-reporter) which takes care of this plumbing for you.

If the test reporter doesn't suit your specific needs, open an issue or pull request on that repository.
