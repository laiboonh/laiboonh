defmodule Laiboonh.RbacsTest do
  use Laiboonh.DataCase

  alias Laiboonh.Accounts
  alias Laiboonh.AccountsFixtures
  alias Laiboonh.Rbacs
  alias Laiboonh.Rbacs.Privilege
  alias Laiboonh.Rbacs.Role
  alias Laiboonh.Rbacs.User

  describe "get_user_by_email/1" do
    test "success" do
      {:ok, user} = Accounts.register_user(AccountsFixtures.valid_user_attributes())
      assert %Laiboonh.Rbacs.User{} = Rbacs.get_user_by_email(user.email)
    end
  end

  describe "get_role_by_name/1" do
    test "success" do
      role_name = "ADMIN"
      insert(:role, name: role_name)
      assert %Laiboonh.Rbacs.Role{name: ^role_name} = Rbacs.get_role_by_name(role_name)
    end
  end

  describe "create_priviledge/1" do
    test "success" do
      assert %Privilege{} = Rbacs.create_priviledge(%{name: "foo"})
    end
  end

  describe "create_role/1" do
    test "success" do
      assert %Role{} = Rbacs.create_role(%{name: "foo"})
    end
  end

  describe "assign_roles_to_user" do
    test "success" do
      {:ok, user} = Accounts.register_user(AccountsFixtures.valid_user_attributes())
      email = user.email
      role = Rbacs.create_role(%{name: "ADMIN"})

      assert %User{} = Rbacs.assign_roles_to_user(email, [role])
      user = Rbacs.get_user_by_email(email) |> Repo.preload(:roles)
      assert [%Role{name: "ADMIN"}] = user.roles

      role = Rbacs.create_role(%{name: "SUPER_USER"})

      assert %User{} = Rbacs.assign_roles_to_user(email, [role])
      user = Rbacs.get_user_by_email(email) |> Repo.preload(:roles)
      assert [%Role{name: "SUPER_USER"}] = user.roles
    end
  end

  describe "assign_privileges_to_role" do
    test "success" do
      role_name = "ADMIN"
      insert(:role, name: role_name)

      privilege = Rbacs.create_priviledge(%{name: "DELETE_USER"})

      assert %Role{} = Rbacs.assign_privileges_to_role(role_name, [privilege])
      role = Rbacs.get_role_by_name(role_name) |> Repo.preload(:privileges)
      assert [%Privilege{name: "DELETE_USER"}] = role.privileges

      privilege = Rbacs.create_priviledge(%{name: "CREATE_USER"})

      assert %Role{} = Rbacs.assign_privileges_to_role(role_name, [privilege])
      role = Rbacs.get_role_by_name(role_name) |> Repo.preload(:privileges)
      assert [%Privilege{name: "CREATE_USER"}] = role.privileges
    end
  end
end
