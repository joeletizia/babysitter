defmodule Babysitter.Repo.Migrations.AddSittersTable do
  use Ecto.Migration

  def change do
    create table(:sitters) do
      add :name, :string, null: false
      add :phone_number, :string, null: false

      timestamps
    end
  end
end
