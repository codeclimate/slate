# Pull Requests

## Get rating changes

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "filter[path]=lib/book.rb" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/pulls/65/files
```

> JSON response:

```json
{
  "data": [
    {
      "id": "69926c2c28352600010003db-59726c2f1e3c870001000312",
      "type": "file_diffs",
      "attributes": {
        "to_rating": "unrated",
        "from_rating": "unrated",
        "path": "lib\/book.rb"
      }
    }
  ]
}
```

Returns rating changes for files in a pull request.

### HTTP Request

`GET https://api.codeclimate.com/v1/repos/:repo_id/pulls/:number/files`

### Query Parameters

[Filterable](#collection-filtering)

Filters include:

| Name | Description | Required? |
| ---- | ----------- | --------- |
| filter[path] | Complete file path for file to filter by | Yes |

## Approve PRs

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --data-urlencode "data[attributes][reason]=merge" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/pulls/65/approvals
```

> JSON response:

```json
{
  "data": {
    "id": "5a60de1a4668b4650a000b5a",
    "type": "approvals",
    "attributes": {
      "reason": "merge",
      "created_at": "2018-01-18T17:49:14.458Z"
    },
    "relationships": {
      "author": {
        "data": {
          "id": "516341ca7e00a428b0015372",
          "type": "users"
        }
      },
      "pull_request": {
        "data": {
          "id": "5a60d683af0a490001000a71",
          "type": "pull_requests"
        }
      },
      "repo": {
        "data": {
          "id": "696a76232df2736347000001",
          "type": "repos"
        }
      }
    }
  }
}
```

Approves a given pull request.

### HTTP Request

`POST https://api.codeclimate.com/v1/repos/:repo_id/pulls/:number/approvals`
