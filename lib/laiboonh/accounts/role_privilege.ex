defmodule Laiboonh.Accounts.RolePrivilege do
  use Ecto.Schema

  schema "roles_privileges" do
    belongs_to :role, Laiboonh.Accounts.Role, type: :binary_id
    belongs_to :privilege, Laiboonh.Accounts.Privilege, type: :binary_id
  end
end
