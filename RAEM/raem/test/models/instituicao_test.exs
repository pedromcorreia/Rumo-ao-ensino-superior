defmodule Raem.InstituicaoTest do
  use Raem.ModelCase

  alias Raem.Instituicao

  @valid_attrs %{cat_administratica: "some cat_administratica", cod_ies: 42, cod_municipio: 42, municipio_curso: "some municipio_curso", nome_ies: "some nome_ies", org_academica: "some org_academica", sigla_ies: "some sigla_ies", sigla_uf: "some sigla_uf"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Instituicao.changeset(%Instituicao{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Instituicao.changeset(%Instituicao{}, @invalid_attrs)
    refute changeset.valid?
  end
end
