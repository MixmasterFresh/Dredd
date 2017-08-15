defmodule DreddWeb.Utils do
  def can?(subject, action, opts \\ []) do
    #implement
  end

  def can?(subject, action, object, opts \\ []) do
    #implement
  end

  def error_with(conn, status) do
    status_atom = status |> Integer.to_string() |> String.to_atom()
    conn
    |> Plug.Conn.put_status(status)
    |> Phoenix.Controller.render(DreddWeb.ErrorView, status_atom)
  end
end
