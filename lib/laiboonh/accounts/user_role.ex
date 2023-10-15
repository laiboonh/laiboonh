defmodule Laiboonh.Accounts.UserRole do
  use Ecto.Schema

  @primary_key {:id, Ecto.ULID, autogenerate: true}
  @foreign_key_type Ecto.ULID

  schema "users_roles" do
    belongs_to :user, Laiboonh.Accounts.User
    belongs_to :role, Laiboonh.Accounts.Role
  end
end
