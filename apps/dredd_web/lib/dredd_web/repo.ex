defmodule DreddWeb.Repo do
  use Ecto.Repo, otp_app: :dredd_web
  use Scrivener, page_size: 10
end
