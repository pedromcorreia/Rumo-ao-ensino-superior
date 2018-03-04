defmodule Raem.IddsTest do
  use Raem.DataCase

  alias Raem.Idds

  describe "idds" do
    alias Raem.Idds.Idd

    @valid_attrs %{ano: ~D[2010-04-17], area_enquadramento: "some area_enquadramento", cat_administrativa: "some cat_administrativa", cod_area: 42, cod_curso: 42, cod_ies: 42, cod_municipio: 42, concluintes_inscritos: 42, concluintes_participantes: 42, concluintes_participantes_enem: 42, idd_faixa: 42, modalidade_ensino: "some modalidade_ensino", municipio_curso: "some municipio_curso", nome_ies: "some nome_ies", nota_bruta_idd: 120.5, nota_padronizada_idd: 120.5, org_academica: "some org_academica", percentual_concluintes_participantes_enem: 120.5, sigla_ies: "some sigla_ies", sigla_uf: "some sigla_uf"}
    @update_attrs %{ano: ~D[2011-05-18], area_enquadramento: "some updated area_enquadramento", cat_administrativa: "some updated cat_administrativa", cod_area: 43, cod_curso: 43, cod_ies: 43, cod_municipio: 43, concluintes_inscritos: 43, concluintes_participantes: 43, concluintes_participantes_enem: 43, idd_faixa: 43, modalidade_ensino: "some updated modalidade_ensino", municipio_curso: "some updated municipio_curso", nome_ies: "some updated nome_ies", nota_bruta_idd: 456.7, nota_padronizada_idd: 456.7, org_academica: "some updated org_academica", percentual_concluintes_participantes_enem: 456.7, sigla_ies: "some updated sigla_ies", sigla_uf: "some updated sigla_uf"}
    @invalid_attrs %{ano: nil, area_enquadramento: nil, cat_administrativa: nil, cod_area: nil, cod_curso: nil, cod_ies: nil, cod_municipio: nil, concluintes_inscritos: nil, concluintes_participantes: nil, concluintes_participantes_enem: nil, idd_faixa: nil, modalidade_ensino: nil, municipio_curso: nil, nome_ies: nil, nota_bruta_idd: nil, nota_padronizada_idd: nil, org_academica: nil, percentual_concluintes_participantes_enem: nil, sigla_ies: nil, sigla_uf: nil}

    def idd_fixture(attrs \\ %{}) do
      {:ok, idd} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Idds.create_idd()

      idd
    end

    test "list_idds/0 returns all idds" do
      idd = idd_fixture()
      assert Idds.list_idds() == [idd]
    end

    test "get_idd!/1 returns the idd with given id" do
      idd = idd_fixture()
      assert Idds.get_idd!(idd.id) == idd
    end

    test "create_idd/1 with valid data creates a idd" do
      assert {:ok, %Idd{} = idd} = Idds.create_idd(@valid_attrs)
      assert idd.ano == ~D[2010-04-17]
      assert idd.area_enquadramento == "some area_enquadramento"
      assert idd.cat_administrativa == "some cat_administrativa"
      assert idd.cod_area == 42
      assert idd.cod_curso == 42
      assert idd.cod_ies == 42
      assert idd.cod_municipio == 42
      assert idd.concluintes_inscritos == 42
      assert idd.concluintes_participantes == 42
      assert idd.concluintes_participantes_enem == 42
      assert idd.idd_faixa == 42
      assert idd.modalidade_ensino == "some modalidade_ensino"
      assert idd.municipio_curso == "some municipio_curso"
      assert idd.nome_ies == "some nome_ies"
      assert idd.nota_bruta_idd == 120.5
      assert idd.nota_padronizada_idd == 120.5
      assert idd.org_academica == "some org_academica"
      assert idd.percentual_concluintes_participantes_enem == 120.5
      assert idd.sigla_ies == "some sigla_ies"
      assert idd.sigla_uf == "some sigla_uf"
    end

    test "create_idd/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Idds.create_idd(@invalid_attrs)
    end

    test "update_idd/2 with valid data updates the idd" do
      idd = idd_fixture()
      assert {:ok, idd} = Idds.update_idd(idd, @update_attrs)
      assert %Idd{} = idd
      assert idd.ano == ~D[2011-05-18]
      assert idd.area_enquadramento == "some updated area_enquadramento"
      assert idd.cat_administrativa == "some updated cat_administrativa"
      assert idd.cod_area == 43
      assert idd.cod_curso == 43
      assert idd.cod_ies == 43
      assert idd.cod_municipio == 43
      assert idd.concluintes_inscritos == 43
      assert idd.concluintes_participantes == 43
      assert idd.concluintes_participantes_enem == 43
      assert idd.idd_faixa == 43
      assert idd.modalidade_ensino == "some updated modalidade_ensino"
      assert idd.municipio_curso == "some updated municipio_curso"
      assert idd.nome_ies == "some updated nome_ies"
      assert idd.nota_bruta_idd == 456.7
      assert idd.nota_padronizada_idd == 456.7
      assert idd.org_academica == "some updated org_academica"
      assert idd.percentual_concluintes_participantes_enem == 456.7
      assert idd.sigla_ies == "some updated sigla_ies"
      assert idd.sigla_uf == "some updated sigla_uf"
    end

    test "update_idd/2 with invalid data returns error changeset" do
      idd = idd_fixture()
      assert {:error, %Ecto.Changeset{}} = Idds.update_idd(idd, @invalid_attrs)
      assert idd == Idds.get_idd!(idd.id)
    end

    test "delete_idd/1 deletes the idd" do
      idd = idd_fixture()
      assert {:ok, %Idd{}} = Idds.delete_idd(idd)
      assert_raise Ecto.NoResultsError, fn -> Idds.get_idd!(idd.id) end
    end

    test "change_idd/1 returns a idd changeset" do
      idd = idd_fixture()
      assert %Ecto.Changeset{} = Idds.change_idd(idd)
    end
  end
end
