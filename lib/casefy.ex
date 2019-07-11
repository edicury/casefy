defmodule Casefy do

  defp casefy(object, module) when is_map(object) do
    keys = Map.keys(object)

    Enum.reduce(keys, Map.new(), fn element, acc ->
      transform = is_atom(element)
      el =
        transform
        |> case do
          true -> Atom.to_string(element)
          false -> element
        end
      camel_key = apply(module, :convert, [el])
      current_value = Map.get(object, element)
      Map.put(acc, camel_key, casefy(current_value, module))
    end)
  end

  defp casefy(list, module) when is_list(list) do
    list |> Enum.map(fn e -> casefy(e, module) end)
  end

  defp casefy(any, _module) do
    any
  end

  def camel_case(object), do: casefy(object, Recase.CamelCase)
  @spec snake_case(map) :: any
  def snake_case(object), do: casefy(object, Recase.SnakeCase)
end
