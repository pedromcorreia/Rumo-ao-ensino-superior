defmodule Raem.Repo.Migrations.CreateIdds do
  use Ecto.Migration

  def change do
    create table(:idds) do
      add :ano, :string
      add :cod_ies, :integer
      add :nome_ies, :string
      add :sigla_ies, :string
      add :org_academica, :string
      add :cat_administrativa, :string
      add :cod_curso, :integer
      add :cod_area, :integer
      add :area_enquadramento, :string
      add :modalidade_ensino, :string
      add :cod_municipio, :integer
      add :municipio_curso, :string
      add :sigla_uf, :string
      add :concluintes_inscritos, :integer
      add :concluintes_participantes, :integer
      add :concluintes_participantes_enem, :integer
      add :percentual_concluintes_participantes_enem, :float
      add :nota_bruta_idd, :float
      add :nota_padronizada_idd, :float
      add :idd_faixa, :integer

      timestamps()
    end

  end
end
