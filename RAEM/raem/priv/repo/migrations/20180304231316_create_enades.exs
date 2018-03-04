defmodule Raem.Repo.Migrations.CreateEnades do
  use Ecto.Migration

  def change do
    create table(:enades) do
      add :cod_grupo, :integer
      add :cod_ies, :integer
      add :cod_municipio, :integer
      add :ano, :date
      add :area, :string
      add :sub_area, :string
      add :nome_ies, :string
      add :sigla_ies, :string
      add :municipio, :string
      add :uf, :string
      add :media_fg_ing, :float
      add :media_fg_cong, :float
      add :media_ce_ing, :float
      add :media_ce_conc, :float
      add :media_geral_ing, :float
      add :media_geral_conc, :float
      add :conceito_enade, :integer
      add :conceito_idd, :integer

      timestamps()
    end

  end
end
