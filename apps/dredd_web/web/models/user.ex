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

    timestamps()
  end

  def changeset(struct, params) do
    changeset = struct
    |> cast(params, [:username, :password, :name, :email])
    |> validate_required([:username, :password, :name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 3)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:username)
    |> unique_constraint(:email)

    changeset
    |> put_change(:encrypted_password, Comeonin.Bcrypt.hashpwsalt(changeset.params[:password]))
  end

  def find_and_confirm_password(params) do
    username = params[:username]
    password = params[:password]

    if username and password do
      user = Repo.get_by(User, username: String.downcase(username))
      case user do
        nil -> {:error, "Username or password is incorrect."}
        _ ->
          if Comeonin.Bcrypt.checkpw(password, user.password) do
            {:ok, user}
          else
            {:error, "Username or password is incorrect."}
          end
      end
    else
      {:error, "Username or password is incorrect."}
    end
  end
end
