defmodule DreddWeb.Router do
  use DreddWeb.Web, :router
  use ExAdmin.Router

  import DreddWeb.Pipelines

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.EmailPreviewPlug
  end

  scope "/", DreddWeb do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index

    get "/login", LoginController, :index
    post "/login", LoginController, :login
    get "/logout", LoginController, :logout

    scope "/register" do
      get "/", SignupController, :show
      post "/", SignupController, :signup
      get "/safe", SignupController, :safe_show
    end

    scope "/user" do
      get "/:id", UserController, :show
      get "/:id/edit", UserController, :edit
      post "/:id", UserController, :post
      post "/new", UserController, :create
    end

    scope "/class" do
      get "/", ClassController, :index
      get "/:id", ClassController, :show
      post "/:id", ClassController, :edit
      post "/new", ClassController, :new
    end

    get "/dashboard", DashboardController, :show
  end


  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes()
  end

  scope "/api/v1", DreddWeb do
    pipe_through :api

    post "/register", WorkerController, :register
    post "/report", WorkerController, :report
    post "/heartbeat", WorkerController, :heartbeat
  end
end
