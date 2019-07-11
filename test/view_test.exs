defmodule Casefy.ViewTest do
  use ExUnit.Case
  doctest Casefy.View
  use Casefy.View, parse: :camel_case


  test "returns deeply nested object in camelCase format" do
    expected = %{"camelCase" => 1, "anotherKey" => %{"nestedKey" => 2, "anotherNestedKey" => [%{"insideArray" => 1}]}}
    assert renderer(%{camel_case: 1, another_key: %{nested_key: 2, another_nested_key: [%{inside_array: 1}]}}) == expected
  end

  test "returns deeply nested object in snake_case format" do

    expected = %{"camel_case" => 1, "another_key" => %{"nested_key" => 2}}
    assert renderer(%{camelCase: 1, anotherKey: %{nestedKey: 2}}, :snake_case) == expected
  end
end
