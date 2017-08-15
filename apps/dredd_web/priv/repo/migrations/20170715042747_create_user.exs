defmodule DreddWeb.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :encrypted_password, :string
      add :name, :string, null: false
      add :email, :string, null: false
      add :role, :string, null: false, default: "user"
      add :token, :string
      add :valid, :boolean, null: false, default: false
      add :deleted, :boolean, null: false, default: false

      timestamps()
    end
  end
end
