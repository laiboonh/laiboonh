defmodule Laiboonh.Accounts.UserRole do
  use Ecto.Schema

  schema "users_roles" do
    belongs_to :user, Laiboonh.Accounts.User
    belongs_to :role, Laiboonh.Accounts.Role, type: :binary_id
  end
end
