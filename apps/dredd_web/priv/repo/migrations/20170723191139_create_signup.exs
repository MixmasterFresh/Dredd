defmodule DreddWeb.Repo.Migrations.CreateSignup do
  use Ecto.Migration

  def change do
    create table(:signups) do
      add :email, :string
      add :token, :string

      timestamps()
    end

  end
end
