defmodule Casefy.Plug do
  def init(options), do: options

  def call(
        %Plug.Conn{} = conn,
        opts
      ) do
    input =
      opts[:fields]
      |> Enum.reduce(conn, fn e, acc ->
        current = Casefy.snake_case(Map.get(conn, e, %{}))
        Map.replace!(acc, e, current)
      end)

    input
  end
end
