defmodule Raem.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :field, :string
      add :from, :string
      add :to, :string

      timestamps()
    end

  end
end
