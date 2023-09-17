defmodule Laiboonh.Rbacs.Privilege do
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @primary_key {:id, :binary_id, autogenerate: true}

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
