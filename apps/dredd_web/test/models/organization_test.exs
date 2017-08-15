defmodule DreddWeb.OrganizationTest do
  use DreddWeb.ModelCase

  alias DreddWeb.Organization

  @valid_attrs %{name: "some content", namespace: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Organization.changeset(%Organization{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Organization.changeset(%Organization{}, @invalid_attrs)
    refute changeset.valid?
  end
end
