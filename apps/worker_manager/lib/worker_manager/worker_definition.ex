defmodule WorkerManager.WorkerDefinition do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:name, :type, :cores, :tennants, :access_type, :location]

  embedded_schema do
    field :name, :string
    field :type, :string
    field :cores, :integer
    field :tennants, :integer
    field :access_type, :string
    field :location, :string
  end

  def create_worker(json) do
    changeset = %WorkerManager.WorkerDefinition{}
    |> Ecto.Changeset.cast(json, @required_fields)
    |> validate_required(@required_fields)

    if changeset.valid? do
      {:ok, Ecto.Changeset.apply_changes(changeset)}
    else
      {:error, changeset}
    end
  end
end
