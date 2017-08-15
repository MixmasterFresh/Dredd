defmodule DreddWeb.Repo.Migrations.CreateClass do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :name, :string
      add :organization_id, references(:organizations, on_delete: :nothing)

      timestamps()
    end
    create index(:classes, [:organization_id])

  end
end
