defmodule Raem.CursoTest do
  use Raem.ModelCase

  alias Raem.Curso

  @valid_attrs %{area_enquadramento: "some area_enquadramento", cod_area: 42, cod_curso: 42, concluintes_inscritos: 42, concluintes_participantes: 42, concluintes_participantes_enem: 42, idd_faixa: 42, modalidade_ensino: "some modalidade_ensino", nota_bruta_idd: 120.5, nota_padronizada_idd: 120.5, percentual_concluintes_participantes_enem: 120.5}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Curso.changeset(%Curso{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Curso.changeset(%Curso{}, @invalid_attrs)
    refute changeset.valid?
  end
end
