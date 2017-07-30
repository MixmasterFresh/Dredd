defmodule DreddWeb.PageController do
  use DreddWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
