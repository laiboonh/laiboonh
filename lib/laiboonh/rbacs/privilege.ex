defmodule Laiboonh.Rbacs.Privilege do
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @primary_key {:id, Ecto.ULID, autogenerate: true}
  @foreign_key_type Ecto.ULID

  schema "privileges" do
    field :name, :string
    timestamps()
  end

  def changeset(privilege, attrs) do
    privilege
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
