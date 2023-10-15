defmodule Laiboonh.Rbacs.Role do
  use Ecto.Schema
  import Ecto.Changeset
  alias Laiboonh.Repo

  @type t :: %__MODULE__{}

  @primary_key {:id, Ecto.ULID, autogenerate: true}
  @foreign_key_type Ecto.ULID

  schema "roles" do
    field :name, :string

    many_to_many :privileges, Laiboonh.Rbacs.Privilege,
      join_through: Laiboonh.Accounts.RolePrivilege,
      on_replace: :delete

    timestamps()
  end

  @spec assign_privileges(Laiboonh.Rbacs.Role.t(), [Laiboonh.Rbacs.Privilege.t()]) ::
          Ecto.Changeset.t()
  def assign_privileges(role, privileges) do
    Repo.preload(role, :privileges)
    |> change()
    |> put_assoc(:privileges, privileges)
  end

  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
