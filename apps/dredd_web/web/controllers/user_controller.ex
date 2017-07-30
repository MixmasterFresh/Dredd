defmodule DreddWeb.UserController do
  use DreddWeb.Web, :controller

  def show(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    if user.id == params[:id] do
      not_found(conn)
    else
      if user.role == "admin" do
        not_found(conn)
      else
        not_found(conn)
      end
    end
  end

  def edit(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    if user.id == params[:id] do
      not_found(conn)
    else
      if user.role == "admin" do
        not_found(conn)
      else
        not_found(conn)
      end
    end
  end

  def post(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    if user.id == params[:id] do
      not_found(conn)
    else
      if user.role == "admin" do
        not_found(conn)
      else
        not_found(conn)
      end
    end
  end

  def not_found(conn) do
    conn
    |> put_status(:not_found)
    |> render(DreddWeb.ErrorView, "404.html")
  end
end
