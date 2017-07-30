defmodule DreddWeb.DashboardController do
  use DreddWeb.Web, :controller

  def show(conn, _params) do
    render conn, "dashboard.html"
  end
end
