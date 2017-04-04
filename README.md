# PhoenixOauth2Provider

[![Build Status](https://travis-ci.org/danschultzer/phoenix_oauth2_provider.svg?branch=master)](https://travis-ci.org/danschultzer/phoenix_oauth2_provider)

Get an OAuth 2 provider running in your Phoenix app with controllers, views and models in just two minutes.

## Installation

Add PhoenixOauth2Provider to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    # ...
    {:phoenix_oauth2_provider, "~> 0.1.0"}
    # ...
  ]
end
```

Run `mix deps.get` to install it.

Add migrations and set up `config/config.exs`:

```bash
mix phoenix_oauth2_provider.install
```

Set up routes:

```elixir
defmodule MyApp.Router do
  use MyApp.Web, :router
  use ExOauth2Provider.Router
  ...
  scope "/", MyApp do
    ...
  end

  scope "/" do
    pipe_through :protected # Make sure that a user session exists
    oauth2_paths()
  end
end
```

That's it! The following OAuth 2.0 routes will now be available in your app:

```
oauth_authorize_path  GET    /oauth/authorize
oauth_authorize_path  POST   /oauth/authorize
oauth_authorize_path  GET    /oauth/authorize/:code
oauth_authorize_path  DELETE /oauth/authorize
```

## Configuration

### Resource owner schema

You'll need to add a resource owner schema.

```elixir
config :ex_oauth2_provider, ExOauth2Provider,
  repo: MyApp.Repo,
  resource_owner_model: MyApp.User
```

### Resource owner

Set up what `assigns` in the plug that PhoenixOauth2Provider should gather the authorized user from.

```elixir
config :phoenix_oauth2_provider, PhoenixOauth2Provider,
  current_resource_owner: :current_user
```

## Acknowledgement

This library was made thanks to [coherence](https://github.com/smpallen99/coherence) that gave the conceptual building blocks.

## LICENSE

(The MIT License)

Copyright (c) 2017 Dan Schultzer & the Contributors Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.