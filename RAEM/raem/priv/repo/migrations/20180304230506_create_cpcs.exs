defmodule Raem.Repo.Migrations.CreateCpcs do
  use Ecto.Migration

  def change do
    create table(:cpcs) do
      add :ano, :date
      add :cod_area, :integer
      add :area_enquadramento, :string
      add :cod_ies, :integer
      add :nome_ies, :string
      add :sigla_ies, :string
      add :cat_administrativa, :string
      add :org_academica, :string
      add :cod_municipio, :integer
      add :mun_curso, :string
      add :uf_curso, :string
      add :regiao_curso, :string
      add :num_cursos_unidade, :integer
      add :concluintes_inscritos, :integer
      add :concluintes_participantes, :integer
      add :nota_bruta_fg, :float
      add :nota_bruta_ce, :float
      add :nota_bruta_geral, :float
      add :nota_continua_enade, :float
      add :nota_bruta_odp, :float
      add :nota_padronizada_odp, :float
      add :nota_padronizada_iif, :float
      add :nota_bruta_oaf, :float
      add :nota_padronizada_oaf, :float
      add :concluintes_participantes_enem, :integer
      add :percentual_concluintes_enem, :float
      add :nota_bruta_idd, :float
      add :nota_padronizada_idd, :float
      add :num_docentes, :integer
      add :num_matriculas, :integer
      add :nota_bruta_mestres, :float
      add :nota_padronizada_mestres, :float
      add :nota_bruta_doutores, :float
      add :nota_padronizada_doutores, :float
      add :nota_bruta_regime_trabalho, :float
      add :nota_padronizada_regime_trabalho, :float
      add :cpc_continuo, :float
      add :cpc_faixa, :integer
      add :observacao, :string

      timestamps()
    end

  end
end
