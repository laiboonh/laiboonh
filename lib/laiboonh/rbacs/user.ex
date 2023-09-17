defmodule Laiboonh.Rbacs.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Laiboonh.Repo

  @type t :: %__MODULE__{}

  schema "users" do
    field :email, :string
    many_to_many :roles, Laiboonh.Rbacs.Role, join_through: "users_roles", on_replace: :delete
  end

  @spec assign_roles(Laiboonh.Rbacs.User.t(), [Laiboonh.Rbacs.Role.t()]) :: Ecto.Changeset.t()
  def assign_roles(user, roles) do
    Repo.preload(user, :roles)
    |> change()
    |> put_assoc(:roles, roles)
  end
end
