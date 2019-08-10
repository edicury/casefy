defmodule Casefy do
  defp casefy(object, module) when is_map(object) do
    Map.keys(object)
    |> Enum.reduce(%{}, fn key, acc ->
      current_key =
        case is_bitstring(key) do
          true -> key
          false -> Atom.to_string(key)
        end

      current = Map.get(object, key)
      formatted_key = apply(module, :convert, [current_key])

      Map.put(acc, formatted_key, casefy(current, module))
    end)
  end

  defp casefy(object, module) when is_list(object) do
    Enum.map(object, fn o -> casefy(o, module) end)
  end

  defp casefy(object, _module) do
    object
  end

  def camel_case(object), do: casefy(object, Recase.CamelCase)
  @spec snake_case(map) :: any
  def snake_case(object), do: casefy(object, Recase.SnakeCase)
end
