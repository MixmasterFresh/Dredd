defmodule DreddWeb.Membership do
  use DreddWeb.Web, :model

  schema "memberships" do
    field :role, :string
    belongs_to :class, DreddWeb.Class
    belongs_to :user, DreddWeb.User

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:role])
    |> validate_required([:role])
  end
end
