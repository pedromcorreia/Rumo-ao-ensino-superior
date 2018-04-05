defmodule Raem.Repo.Migrations.CreateInstituicao do
  use Ecto.Migration

  def change do
    create table(:instituicoes) do
      add :cod_ies, :integer
      add :nome_ies, :string
      add :sigla_ies, :string
      add :org_academica, :string
      add :cat_administratica, :string

      timestamps()
    end
  end
end
