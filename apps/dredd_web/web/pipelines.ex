defmodule DreddWeb.Pipelines do
  use DreddWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug DreddWeb.CurrentUser
  end

  pipeline :require_login do
    plug Guardian.Plug.EnsureAuthenticated, handler: DreddWeb.LoginController
    plug DreddWeb.CurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
end
