defmodule Raem.Repo.Migrations.CreateIgcs do
  use Ecto.Migration

  def change do
    create table(:igcs) do
      add :cod_ies, :integer
      add :ano, :string
      add :num_cursos_avaliados, :integer
      add :num_cursos_cpc, :integer
      add :alfa_proporcao_graduandos, :float
      add :conceito_graduacao, :float
      add :beta_proporcao_mestrandos, :float
      add :conceito_mestrado, :float
      add :gama_proporcao_doutorando, :float
      add :conceito_doutorado, :float
      add :igc_continuo, :float
      add :igc_faixa, :integer
      add :observacao, :string

      timestamps()
    end

  end
end
