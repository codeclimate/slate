# Organizations

## Get organizations

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/orgs
```

> JSON response:

```json
{
  "data": [
    {
      "id": "3334f0eaf3ea115e91218182",
      "type": "orgs",
      "attributes": {
        "name": "Twin Peaks"
      },
      "meta": {
        "counts": {
          "repos": 6
        },
        "permissions": {
          "admin": true
        }
      }
    },
    {
      "id": "591d76793b8b820267111402",
      "type": "orgs",
      "attributes": {
        "name": "FBI"
      },
      "meta": {
        "counts": {
          "repos": 0
        },
        "permissions": {
          "admin": true
        }
      }
    }
  ],
  "links": {
  }
}
```

Returns collection of organizations for the current user.

### HTTP Request

`GET https://api.codeclimate.com/v1/orgs`

### Query Parameters

[Paginated](#collection-pagination)

Not filterable.

## Get permissions

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/orgs/596b70adb79d8f147b000002/permissions
```

> JSON response:

```json
{
  "data": [
    {
      "id": "approve-pull-requests",
      "type": "team_permissions",
      "attributes": {
        "name": "approve-pull-requests",
        "granted_to": "members"
      },
      "meta": {
        "options": [
          "members",
          "owners"
        ]
      }
    },
    {
      "id": "manage-issues",
      "type": "team_permissions",
      "attributes": {
        "name": "manage-issues",
        "granted_to": "members"
      },
      "meta": {
        "options": [
          "members",
          "owners"
        ]
      }
    }
  ]
}
```

Retrieves permissions such as which members can manage issues and/or approve pull
requests.

### HTTP Request

`POST https://api.codeclimate.com/v1/orgs/:org_id/permissions`

### Query Parameters

N/A

## Create organization

> Given a JSON file "create-org.json" with the following contents ...

```json
{
  "data": {
    "type": "orgs",
    "attributes": {
      "name": "Twin Peaks"
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
  -d @create-org.json \
  https://api.codeclimate.com/v1/orgs
```

> ... which returns JSON like this:

```json
{
  "data": {
    "id": "596b70adb79d8f147b000002",
    "type": "orgs",
    "attributes": {
      "name": "Black Lodge"
    },
    "meta": {
      "counts": {
        "repos": 0
      },
      "permissions": {
        "admin": true
      }
    }
  }
}
```

Creates a new single-person organization with the specified attributes.

If the organization was created successfully, this endpoint responds with the
created organization and status `201`.

### HTTP Request

`POST https://api.codeclimate.com/v1/orgs`

### POST Parameters

Request is a JSON API document which complies with the specification for
resource creation requests. See example POST in gutter for format.

For more details, consult [Creating Resources](http://jsonapi.org/format/#crud-creating).

| Parameter | Description | Required? |
| --------- | ----------- | --------- |
| name      | Name of the new organization | Yes |

## Add private repository

> Given a JSON file "create-private-repository.json" with the following contents ...

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
  -d @create-private-repository.json \
  https://api.codeclimate.com/v1/orgs/596b70adb79d8f147b000002/repos
```

> ... which returns JSON like this:

```json
{
  "data": {
    "id": "696a76232df2736347000001",
    "type": "repos",
    "attributes": {
      "analysis_version": 3385,
      "badge_token": "16096d266f46b7c68dd4",
      "branch": "master",
      "created_at": "2017-07-15T20:08:03.731Z",
      "github_slug": "twinpeaks\/ranchorosa",
      "human_name": "ranchorosa",
      "last_activity_at": "2017-07-15T20:08:03.731Z",
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
}
```

Adds the repository to the specified organization.

If the repository was added successfully, this endpoint responds with the
added repository and status `201`.

### HTTP Request

`POST https://api.codeclimate.com/v1/orgs/:org_id/repos`

### POST Parameters

Request is a JSON API document which complies with the specification for
resource creation requests. See example POST in gutter for format.

For more details, consult [Creating Resources](http://jsonapi.org/format/#crud-creating).

| Parameter | Description | Required? |
| --------- | ----------- | --------- |
| url       | Code Climate uses the `url` parameter to determine where your repository is hosted and how to clone it. Currently, only repositories hosted on GitHub are supported, so we only accept `https://github.com` URLs. Once created, users will still find a Deploy Key added on GitHub and an SSH-based clone URL in their repo settings. | Yes |

## Get repositories

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/orgs/596b70adb79d8f147b000002/repos
```

> JSON response

```json
{
  "data": [
    {
      "id": "596a76232df1736777000001",
      "type": "repos",
      "attributes": {
        "analysis_version": 3436,
        "badge_token": "16096d266f46b7c68dc4",
        "branch": "master",
        "created_at": "2017-07-15T20:08:03.732Z",
        "github_slug": "twinpeaks\/ranchorosa",
        "human_name": "ranchorosa",
        "last_activity_at": "2017-07-26T00:42:23.337Z",
        "score": 1.36
      },
      "relationships": {
        "latest_default_branch_snapshot": {
          "data": {
            "id": "5977e4cba2a8970001016f25",
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
        "self": "https:\/\/codeclimate.com\/repos\/596a76232df1736777000001",
        "services": "https:\/\/api.codeclimate.com\/v1\/repos\/596a76232df1736777000001\/services",
        "web_coverage": "https:\/\/codeclimate.com\/repos\/596a76232df1736777000001\/coverage",
        "web_issues": "https:\/\/codeclimate.com\/repos\/596a76232df1736777000001\/issues"
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

Returns listing of repositories for the specified organization that the authenticated
user (user associated with the passed token) has access to.

### HTTP Request

`GET https://api.codeclimate.com/v1/orgs/:org_id/repos`

### Query Parameters

N/A
