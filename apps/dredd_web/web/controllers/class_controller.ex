defmodule DreddWeb.ClassController do
  use DreddWeb.Web, :controller

  def permissions do
    %{
      create_class_in_org: fn user, org ->
        User.is_admin?(user) || User.is_org_admin?(user, org)
      end,
      view_class: fn user, class ->
        User.is_related_to_class?(user, class) || User.is_org_admin?(user, class.organization)
      end,
      edit_class: fn user, class ->
        User.owns_class?(user,class) || User.is_org_admin?(user, class.organization)
      end
    }
  end

  def new(conn, params) do
    current_user = current_user(conn)
    org = current_org()
    if can?(current_user, :create_class_in_org, org, permissions: permissions) do

    end
    #create new class
    #redirect to new class page
  end

  def show(conn, params) do
    current_user = current_user(conn)
    class = #fetch class
    if can?(current_user, :view_class, class, permissions: permissions) do
      render conn, "class.html" #pass class to view
    else
      error_with conn, 404
    end
  end

  def edit(conn, _params) do
    current_user = current_user(conn)
    if can?(current_user, :edit_class, class, permissions: permissions) do

    end
    #fetch class
    #pass class to view
    render conn, "edit.html"
  end

  def post(conn, params) do
    current_user = current_user(conn)
    if can?(current_user, :edit_class, class, permissions: permissions) do

    end
    #process edits
    redirect conn, to: "/class/#{params[:class]}"
  end

  def view_students(conn, _params) do
    current_user = current_user(conn)
    if can?(current_user, :edit_class, class, permissions: permissions) do

    end
    #fetch roster
    #pass roster to view
    #list out roster in terms of valid and invalid users
    render conn, "roster.html"
  end

  def add_students(conn, params) do
    current_user = current_user(conn)
    if can?(current_user, :edit_class, class, permissions: permissions) do

    end
    #collect list of emails from post params
    #create students if not existing
    #create memberships for the class
    redirect conn, to: "/class/#{params[:class]}"
  end
end
