defmodule Raem.Repo.Migrations.CreateCurso do
  use Ecto.Migration

  def change do
    create table(:cursos) do
      add :cod_curso, :integer
      add :cod_area, :integer
      add :area_enquadramento, :string
      add :modalidade_ensino, :string
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
