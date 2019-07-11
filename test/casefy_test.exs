defmodule CasefyTest do
  use ExUnit.Case
  doctest Casefy

  test "returns deeply nested object in camelCase format" do
    expected = %{"camelCase" => 1, "anotherKey" => %{"nestedKey" => 2, "anotherNestedKey" => [%{"insideArray" => 1}]}}
    assert Casefy.camel_case(%{camel_case: 1, another_key: %{nested_key: 2, another_nested_key: [%{inside_array: 1}]}}) == expected
  end

  test "returns deeply nested object in snake_case format" do
    expected = %{"camel_case" => 1, "another_key" => %{"nested_key" => 2}}
    assert Casefy.snake_case(%{camelCase: 1, anotherKey: %{nestedKey: 2}}) == expected
  end

end
