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
  --data-urlencode "reason=Just because." \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/pulls/65/approve
```

Approves a given pull request.

### HTTP Request

`POST https://api.codeclimate.com/v1/repos/:repo_id/pulls/:number/approve`

### Post Parameters

| Parameter | Description | Required? |
| --------- | ----------- | --------- |
| reason    | Reason pull request is being approved. | No |
