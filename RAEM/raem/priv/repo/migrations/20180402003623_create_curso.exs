defmodule Raem.Repo.Migrations.CreateCurso do
  use Ecto.Migration

  def change do
    create table(:cursos) do
      add :cod_curso, :integer
      add :cod_area, :integer
      add :cod_ies, :integer
      add :area_enquadramento, :string
      add :modalidade_ensino, :string
      add :cod_municipio, :integer
      add :municipio_curso, :string
      add :sigla_uf, :string

      timestamps()
    end
  end
end
