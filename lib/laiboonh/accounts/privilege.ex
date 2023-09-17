defmodule Laiboonh.Accounts.Privilege do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "privileges" do
    field :name, :string
  end
end
