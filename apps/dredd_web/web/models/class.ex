defmodule DreddWeb.Class do
  use DreddWeb.Web, :model

  schema "classes" do
    field :name, :string
    field :description, :string
    belongs_to :organization, DreddWeb.Organization
    many_to_many :users, Tag, join_through: "memberships"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate()
  end

  def validate(struct) do
    struct
    |> validate_required([:name])
  end
end
