defmodule Raem.Repo.Migrations.CreateInstituicoes do
  use Ecto.Migration

  def change do
    create table(:instituicoes) do
      add :cod_ies, :integer
      add :nome_ies, :string
      add :sigla_ies, :string
      add :org_academica, :string
      add :cat_administrativa, :string

      timestamps()
    end

  end
end
