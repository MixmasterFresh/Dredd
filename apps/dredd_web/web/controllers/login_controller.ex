defmodule DreddWeb.LoginController do
  use DreddWeb.Web, :controller
  alias DreddWeb.User


  def index(conn, _params) do
    render conn, "login.html"
  end

  def login(conn, params) do
    case User.find_and_confirm_password(params) do
      {:ok, user} ->
         conn
         |> Guardian.Plug.sign_in(user)
         |> redirect(to: "/")
      {:error, changeset} ->
        render conn, "login.html", changeset: changeset
    end
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Signed out")
    |> redirect(to: "/")
  end

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> put_flash(:error, "Authentication required")
    |> redirect(to: "/login")
  end

end
