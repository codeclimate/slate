# Overview

Code Climate's API exposes user, organization and repository data displayed and used by our web application (and browser extension).

The API complies with REST standards and the JSON API specification. In addition to our documentation here, you may find additional help by consulting the [JSON API specification](http://jsonapi.org/).

As per the JSON API, clients should use the [JSON API media type](http://jsonapi.org/format/#content-negotiation-clients) where appropriate (and the examples demonstrate this).

If your organization uses codeclimate.com, the URL for the api is: `https://api.codeclimate.com/`.

For on premise customers, use your normal Code Climate host name, but prefix endpoints with `/api`.

All endpoints are prefixed by the API version. The current version is `/v1`.

Following this, here are the base URLs (assuming current version):

**codeclimate.com:** `https://api.codeclimate.com/v1`

**On premise:** `https://{YOUR-CC-HOST-NAME}/api/v1`

## Authentication

> All authenticated calls must include a Authorization header including a valid token.

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  https://api.codeclimate.com/v1/user
```

> Make sure to replace `{TOKEN}` with your API access token.

Code Climate uses API access tokens to allow access to the API. You can generate a new Code Climate personal access token on codeclimate.com in the [token settings](https://codeclimate.com/profile/tokens) area of your Code Climate user profile.

Code Climate expects for the API token to be included in all API requests to the server in a header that looks like the following (replace {TOKEN} with your own):

`Authorization: Token token={TOKEN}`

## Data Types

Where possible, the Code Climate API uses consistent formats to represent common types. These are listed below.

Type           | Format
-------------- | --------------
id             | stringified BSON object id
timestamp      | ISO8601-formatted timestamp (e.g. `2015-12-17T18:58:07.301Z`)

## Rate Limit

The API enforces a limit of 5,000 requests per token per hour.

## Collection Pagination

> Request for 3rd page with 10 items per page

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "page[size]=10" \
  --data-urlencode "page[number]=3" \
  https://api.codeclimate.com/v1/orgs
```

The Code Climate API supports pagination for resource collections.

As [per the JSON API](http://jsonapi.org/format/#fetching-pagination), paginate
through resources with a top level `page[]` query parameter. In the Code Climate API
(JSON API is agnostic to how `page[]` is used),
the `page[]` parameter supports nested `page` and `size` parameters.

Query parameter | Description | Default | Max |
--------------- | ----------- | ------- | --- |
page[size]      | The number of items to return per page | 30 | 100 |
page[number]    | The page number to request | 1 | n/a |

## Collection Filtering

> Filtering by basic key / value

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "filter[branch]=master" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/ref_points
```

> Filtering with `$in` operator, passing multiple values. Note that the parameter is specified more than once:

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "filter[branch][$in][]=master" \
  --data-urlencode "filter[branch][$in][]=development" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001/ref_points
```

In some cases, where specified, the Code Climate API supports filtering resource
collections.

As [per the JSON API](http://jsonapi.org/format/#fetching-filtering), filter
resources with a top level `filter[]` query parameter.

The JSON API is agnostic beyond the `filter[]` key. In the Code Climate API,
filters can be of two basic formats (examples on the right):

1. A basic key/value
2. A more complex data structure with an operator. At this time only the `$in` operator is supported.

See the `Query Parameters` section of each endpoint for details about what filters are supported.

## Fetching associated resources

Code Climate's API supports [loading associated resources|http://jsonapi.org/format/#fetching-includes] in a single API call.

To determine what associated resources can be loaded, inspect the `relationships` section of the API response. For example, the GET repo endpoint returns a JSON response with a `relationships` key, where one of the relationships is named `latest_default_branch_snapshot`.

Fetch the associated resource(s) by using the `include` query string parameter. Multiple included resources should use an `include[]` parameter, with resources specified as a comma-delimited list.

For example:

```shell
curl \
  -H "Accept: application/vnd.api+json" \
  -H "Authorization: Token token={TOKEN}" \
  --get \
  --data-urlencode "include[]=latest_default_branch_snapshot,account" \
  https://api.codeclimate.com/v1/repos/696a76232df2736347000001
```
