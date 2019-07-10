defmodule Casefy do
  defp casefy(object, module) do
    keys = Map.keys(object)

    Enum.reduce(keys, Map.new(), fn element, acc ->
      camel_key = apply(module, :convert, [Atom.to_string(element)])
      current_value = Map.get(object, element)
      has_keys = is_map(current_value)

      nested =
        has_keys
        |> case do
          true -> casefy(current_value, module)
          false -> current_value
        end

      Map.put(acc, camel_key, nested)
    end)
  end

  def camel_case(object), do: casefy(object, Recase.CamelCase)
  def snake_case(object), do: casefy(object, Recase.SnakeCase)
end
