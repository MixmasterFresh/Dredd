defmodule DreddWeb.Router do
  use DreddWeb.Web, :router

  import DreddWeb.Pipelines

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.EmailPreviewPlug
  end

  scope "/", DreddWeb do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index

    get "/login", LoginController, :index
    post "/login", LoginController, :login

    scope "/user" do
      get "/:id", UserController, :show
      get "/:id/edit", UserController, :edit
      post "/:id", UserController, :post
    end

    get "/dashboard", DashboardController, :show
  end

  scope "/api/v1", DreddWeb do
    pipe_through :api

    post "/register", WorkerController, :register
    post "/report", WorkerController, :report

    post "/heartbeat", WorkerController, :heartbeat
  end
end
