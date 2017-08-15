defmodule DreddWeb.SignupController do
  use DreddWeb.Web, :controller

  def show(conn, params) do
    conn = put_session(conn, :signup_token, params["token"])
    redirect conn, to: "/register/safe"
  end

  def signup(conn, _params) do
    # Create and validate new complete user
    # If invalid redirect to safe signup
    redirect conn, to: "/register/safe"
  end

  def safe_show(conn, _params) do
    token = get_session(conn, :signup_token)
    # Use token to get partial user
    render(conn, "show.html")
  end

  def invalid(conn, _paramas) do
    render(conn, "invalid.html")
  end
end
