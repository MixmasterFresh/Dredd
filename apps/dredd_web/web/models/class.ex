defmodule DreddWeb.Class do
  use DreddWeb.Web, :model

  schema "classes" do
    field :name, :string
    field :description, :string
    belongs_to :organization, DreddWeb.Organization
    many_to_many :students, DreddWeb.User, join_through: "memberships"
    has_many :memberships, DreddWeb.Membership

    timestamps()
  end

  def getClassWithStudents(id) do
    students_query =
       from u in User,
       join: m in Membership,
       on: m.user_id == u.id and m.class_id == ^id,
       preload: [memberships: m]

    query =
       from c in Class,
       where: c.id == ^id,
       preload: [students: ^members_query]

    query |> DreddWeb.Repo.all
  end

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
