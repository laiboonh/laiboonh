defmodule Laiboonh.Accounts.RolePrivilege do
  use Ecto.Schema

  @primary_key {:id, Ecto.ULID, autogenerate: true}
  @foreign_key_type Ecto.ULID

  schema "roles_privileges" do
    belongs_to :role, Laiboonh.Accounts.Role
    belongs_to :privilege, Laiboonh.Accounts.Privilege
  end
end
