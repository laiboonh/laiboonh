defmodule Laiboonh.Accounts.Role do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "roles" do
    field :name, :string

    has_many :role_privileges, Laiboonh.Accounts.RolePrivilege

    has_many :privileges,
      through: [:role_privileges, :privilege]
  end
end
