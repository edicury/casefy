# Casefy

## Usage

# camel_case

```elixir
  Casefy.camel_case(%{camel_case: 1, nested_case: %{ another_case: 1 }}) 
  # returns  %{ "camelCase" => 1, "nestedCase" => %{ "anotherCase" => 1 } }
```

# snake_case

```elixir
  Casefy.snake_case(%{snakeCase: 1, nestedCase: %{anotherCase: 1}}) 
  # returns  %{ "snake_case" => 1, "nested_case" => %{ "another_case" => 1 } }
```

# Plug

On your Router, use:

```elixir
  pipeline :api do
    plug :accepts, ["json"]
    ...
    plug Casefy.Plug, fields: [:query_params, :params, :body_params] # parses all camelCase input to snake_case inside your controller
  end
```

## Tests

```sh
  mix test
```

## Installation

[Available on Hex](https://hex.pm/docs/publish), the package can be installed
by adding `casefy` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:casefy, "~> 0.1.2"}
  ]
end
```