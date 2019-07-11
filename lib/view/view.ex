defmodule Casefy.View do
  defmacro __using__(parse: parse) do
    alias Casefy
    quote do
      def renderer(object, parse_to), do: apply(Casefy, parse_to, [object])

      def renderer(object), do: apply(Casefy, unquote(parse), [object])
    end
  end
end
