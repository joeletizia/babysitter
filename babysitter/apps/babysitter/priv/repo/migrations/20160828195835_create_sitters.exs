defmodule Babysitter.Data.Repo.Migrations.CreateSitters do
  use Ecto.Migration

  def change do
    create table(:sitters) do
      add :name, :string
      add :phone_number, :string

      timestamps
    end
  end
end
