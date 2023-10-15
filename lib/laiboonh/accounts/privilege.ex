defmodule Laiboonh.Accounts.Privilege do
  use Ecto.Schema

  @primary_key {:id, Ecto.ULID, autogenerate: true}
  @foreign_key_type Ecto.ULID

  schema "privileges" do
    field :name, :string
  end
end
