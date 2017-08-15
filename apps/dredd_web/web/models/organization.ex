defmodule DreddWeb.Organization do
  use DreddWeb.Web, :model

  schema "organizations" do
    field :name, :string
    field :namespace, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :namespace])
    |> validate_required([:name, :namespace])
  end
end
