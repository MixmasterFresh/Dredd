defmodule DreddWeb.Repo.Migrations.CreateOrganization do
  use Ecto.Migration

  def change do
    create table(:organizations) do
      add :name, :string
      add :namespace, :string, primary_key: true

      timestamps()
    end

  end
end
