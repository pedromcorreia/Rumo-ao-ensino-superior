defmodule Raem.Cursos.Curso do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Cursos.Curso


  schema "cursos" do
    field :cod_curso, :integer
    field :cod_area, :integer
    field :cod_ies, :integer
    field :area_enquadramento, :string
    field :modalidade_ensino, :string
    field :cod_municipio, :integer
    field :municipio_curso, :string
    field :sigla_uf, :string

   timestamps()
  end

  @doc false
  def changeset(%Curso{} = curso, attrs) do
    curso
    |> cast(attrs, [:cod_curso, :cod_area, :cod_ies, :area_enquadramento, :modalidade_ensino, :cod_municipio, :municipio_curso, :sigla_uf])
    |> validate_required([:cod_curso, :cod_area, :cod_ies, :area_enquadramento, :modalidade_ensino, :cod_municipio, :municipio_curso, :sigla_uf])
  end
end
