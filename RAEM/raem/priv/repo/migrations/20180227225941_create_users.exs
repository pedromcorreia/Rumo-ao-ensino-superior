defmodule Raem.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :title, :string
      add :due, :naive_datetime

      timestamps()
    end

  end
end
