defmodule DreddWeb.User do
  use DreddWeb.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string
    field :name, :string
    field :email, :string
    field :role, :string
    field :token, :string
    field :valid, :boolean
    field :deleted, :boolean
    many_to_many :classes, Tag, join_through: "memberships"

    timestamps()
  end

  def new_partial_user(name, email) do
    %DreddWeb.User{name: name, email: email}
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 3)
    |> unique_constraint(:email)
    |> add_token
  end

  def add_token(changeset) do
    changeset
    |> put_change(:token, :crypto.strong_rand_bytes(length) |> Base.url_encode64(padding: false))
  end

  def register_user(struct, params) do
    changeset = struct
    |> cast(params, [:username, :password])
    |> validate_required([:username, :password])
    |> validate_length(:password, min: 6)
    |> unique_constraint(:username)

    if changeset.valid? do
      changeset
      |> put_change(:encrypted_password, Comeonin.Bcrypt.hashpwsalt(changeset.params[:password]))
      |> put_change(:token, nil)
      |> put_change(:valid, true)
    else
      changeset
    end
  end

  def find_and_confirm_password(params) do
    error = {:error, "Username or password is incorrect."}
    username = params[:username]
    password = params[:password]

    if username and password do
      user = Repo.get_by(User, username: String.downcase(username))
      case user do
        nil -> error
        _ ->
          if Comeonin.Bcrypt.checkpw(password, user.encrypted_password) do
            {:ok, user}
          else
            error
          end
      end
    else
      error
    end
  end
end
