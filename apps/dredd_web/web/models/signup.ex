defmodule DreddWeb.Signup do
  use DreddWeb.Web, :model

  schema "signups" do
    field :email, :string
    field :token, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :token])
    |> validate_required([:email, :token])
  end
end
