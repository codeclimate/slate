# Users

## Get authenticated user

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/user
```

> JSON response:

```json
{
  "data": {
    "id": "516342ca7e11a428b0025372",
    "type": "users",
    "attributes": {
      "email": "dale@twinpeaks.com",
      "enabled_features": [
        "builder_pull_engines",
        "disable_transactions",
        "encrypted_ssh_private_keys"
      ],
      "full_name": "Dale Cooper",
      "staff": false
    },
    "links": {
      "avatar": "https:\/\/avatars.githubusercontent.com\/u\/122672"
    }
  }
}
```

Returns information about the authenticated user.

### HTTP Request

`GET http://api.codeclimate.com/v1/user`

### Query Parameters

N/A
