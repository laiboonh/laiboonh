defmodule Laiboonh.Repo.Migrations.CreateRbacTables do
  use Ecto.Migration

  def change do
    create table(:roles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      timestamps()
    end

    create unique_index(:roles, [:name])

    create table(:users_roles) do
      add :user_id, references("users"), primary_key: true
      add :role_id, references("roles", type: :uuid), primary_key: true
    end

    create table(:privileges, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      timestamps()
    end

    create unique_index(:privileges, [:name])

    create table(:roles_privileges) do
      add :role_id, references("roles", type: :uuid), primary_key: true
      add :privilege_id, references("privileges", type: :uuid), primary_key: true
    end
  end
end
