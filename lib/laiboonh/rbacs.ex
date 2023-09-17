defmodule Laiboonh.Rbacs do
  alias Laiboonh.Rbacs.Privilege
  alias Laiboonh.Rbacs.Role
  alias Laiboonh.Rbacs.User
  alias Laiboonh.Repo

  def get_user_by_email(email) do
    Repo.get_by!(User, email: email)
  end

  def get_role_by_name(name) do
    Repo.get_by!(Role, name: name)
  end

  def create_priviledge(attrs) do
    %Privilege{} |> Privilege.changeset(attrs) |> Repo.insert!()
  end

  def create_role(attrs) do
    %Role{} |> Role.changeset(attrs) |> Repo.insert!()
  end

  def assign_roles_to_user(user_email, roles) do
    get_user_by_email(user_email)
    |> User.assign_roles(roles)
    |> Repo.update!()
  end

  def assign_privileges_to_role(role_name, privileges) do
    get_role_by_name(role_name)
    |> Role.assign_privileges(privileges)
    |> Repo.update!()
  end
end
