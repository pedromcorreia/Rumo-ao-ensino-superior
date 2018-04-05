defmodule Raem.IgcsTest do
  use Raem.DataCase

  alias Raem.Igcs

  describe "igcs" do
    alias Raem.Igcs.Igc

    @valid_attrs %{alfa_proporcao_graduandos: 120.5, ano: ~D[2010-04-17], beta_proporcao_mestrandos: 120.5, cat_administrativa: "some cat_administrativa", cod_ies: 42, conceito_doutorado: 120.5, conceito_graduacao: 120.5, conceito_mestrado: 120.5, gama_proporcao_doutorando: 120.5, igc_continuo: 120.5, igc_faixa: 42, nome_ies: "some nome_ies", num_cursos_avaliados: 42, num_cursos_cpc: 42, observacao: "some observacao", org_academica: "some org_academica", sigla_ies: "some sigla_ies", uf_ies: "some uf_ies"}
    @update_attrs %{alfa_proporcao_graduandos: 456.7, ano: ~D[2011-05-18], beta_proporcao_mestrandos: 456.7, cat_administrativa: "some updated cat_administrativa", cod_ies: 43, conceito_doutorado: 456.7, conceito_graduacao: 456.7, conceito_mestrado: 456.7, gama_proporcao_doutorando: 456.7, igc_continuo: 456.7, igc_faixa: 43, nome_ies: "some updated nome_ies", num_cursos_avaliados: 43, num_cursos_cpc: 43, observacao: "some updated observacao", org_academica: "some updated org_academica", sigla_ies: "some updated sigla_ies", uf_ies: "some updated uf_ies"}
    @invalid_attrs %{alfa_proporcao_graduandos: nil, ano: nil, beta_proporcao_mestrandos: nil, cat_administrativa: nil, cod_ies: nil, conceito_doutorado: nil, conceito_graduacao: nil, conceito_mestrado: nil, gama_proporcao_doutorando: nil, igc_continuo: nil, igc_faixa: nil, nome_ies: nil, num_cursos_avaliados: nil, num_cursos_cpc: nil, observacao: nil, org_academica: nil, sigla_ies: nil, uf_ies: nil}

    def igc_fixture(attrs \\ %{}) do
      {:ok, igc} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Igcs.create_igc()

      igc
    end

    test "list_igcs/0 returns all igcs" do
      igc = igc_fixture()
      assert Igcs.list_igcs() == [igc]
    end

    test "get_igc!/1 returns the igc with given id" do
      igc = igc_fixture()
      assert Igcs.get_igc!(igc.id) == igc
    end

    test "create_igc/1 with valid data creates a igc" do
      assert {:ok, %Igc{} = igc} = Igcs.create_igc(@valid_attrs)
      assert igc.alfa_proporcao_graduandos == 120.5
      assert igc.ano == ~D[2010-04-17]
      assert igc.beta_proporcao_mestrandos == 120.5
      assert igc.cat_administrativa == "some cat_administrativa"
      assert igc.cod_ies == 42
      assert igc.conceito_doutorado == 120.5
      assert igc.conceito_graduacao == 120.5
      assert igc.conceito_mestrado == 120.5
      assert igc.gama_proporcao_doutorando == 120.5
      assert igc.igc_continuo == 120.5
      assert igc.igc_faixa == 42
      assert igc.nome_ies == "some nome_ies"
      assert igc.num_cursos_avaliados == 42
      assert igc.num_cursos_cpc == 42
      assert igc.observacao == "some observacao"
      assert igc.org_academica == "some org_academica"
      assert igc.sigla_ies == "some sigla_ies"
      assert igc.uf_ies == "some uf_ies"
    end

    test "create_igc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Igcs.create_igc(@invalid_attrs)
    end

    test "update_igc/2 with valid data updates the igc" do
      igc = igc_fixture()
      assert {:ok, igc} = Igcs.update_igc(igc, @update_attrs)
      assert %Igc{} = igc
      assert igc.alfa_proporcao_graduandos == 456.7
      assert igc.ano == ~D[2011-05-18]
      assert igc.beta_proporcao_mestrandos == 456.7
      assert igc.cat_administrativa == "some updated cat_administrativa"
      assert igc.cod_ies == 43
      assert igc.conceito_doutorado == 456.7
      assert igc.conceito_graduacao == 456.7
      assert igc.conceito_mestrado == 456.7
      assert igc.gama_proporcao_doutorando == 456.7
      assert igc.igc_continuo == 456.7
      assert igc.igc_faixa == 43
      assert igc.nome_ies == "some updated nome_ies"
      assert igc.num_cursos_avaliados == 43
      assert igc.num_cursos_cpc == 43
      assert igc.observacao == "some updated observacao"
      assert igc.org_academica == "some updated org_academica"
      assert igc.sigla_ies == "some updated sigla_ies"
      assert igc.uf_ies == "some updated uf_ies"
    end

    test "update_igc/2 with invalid data returns error changeset" do
      igc = igc_fixture()
      assert {:error, %Ecto.Changeset{}} = Igcs.update_igc(igc, @invalid_attrs)
      assert igc == Igcs.get_igc!(igc.id)
    end

    test "delete_igc/1 deletes the igc" do
      igc = igc_fixture()
      assert {:ok, %Igc{}} = Igcs.delete_igc(igc)
      assert_raise Ecto.NoResultsError, fn -> Igcs.get_igc!(igc.id) end
    end

    test "change_igc/1 returns a igc changeset" do
      igc = igc_fixture()
      assert %Ecto.Changeset{} = Igcs.change_igc(igc)
    end
  end

  describe "igcs" do
    alias Raem.Igcs.Igc

    @valid_attrs %{alfa_proporcao_graduandos: 120.5, ano: "some ano", beta_proporcao_mestrandos: 120.5, cod_ies: 42, conceito_doutorado: 120.5, conceito_graduacao: 120.5, conceito_mestrado: 120.5, gama_proporcao_doutorando: 120.5, igc_continuo: 120.5, igc_faixa: 42, num_cursos_avaliados: 42, num_cursos_cpc: 42, observacao: "some observacao"}
    @update_attrs %{alfa_proporcao_graduandos: 456.7, ano: "some updated ano", beta_proporcao_mestrandos: 456.7, cod_ies: 43, conceito_doutorado: 456.7, conceito_graduacao: 456.7, conceito_mestrado: 456.7, gama_proporcao_doutorando: 456.7, igc_continuo: 456.7, igc_faixa: 43, num_cursos_avaliados: 43, num_cursos_cpc: 43, observacao: "some updated observacao"}
    @invalid_attrs %{alfa_proporcao_graduandos: nil, ano: nil, beta_proporcao_mestrandos: nil, cod_ies: nil, conceito_doutorado: nil, conceito_graduacao: nil, conceito_mestrado: nil, gama_proporcao_doutorando: nil, igc_continuo: nil, igc_faixa: nil, num_cursos_avaliados: nil, num_cursos_cpc: nil, observacao: nil}

    def igc_fixture(attrs \\ %{}) do
      {:ok, igc} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Igcs.create_igc()

      igc
    end

    test "list_igcs/0 returns all igcs" do
      igc = igc_fixture()
      assert Igcs.list_igcs() == [igc]
    end

    test "get_igc!/1 returns the igc with given id" do
      igc = igc_fixture()
      assert Igcs.get_igc!(igc.id) == igc
    end

    test "create_igc/1 with valid data creates a igc" do
      assert {:ok, %Igc{} = igc} = Igcs.create_igc(@valid_attrs)
      assert igc.alfa_proporcao_graduandos == 120.5
      assert igc.ano == "some ano"
      assert igc.beta_proporcao_mestrandos == 120.5
      assert igc.cod_ies == 42
      assert igc.conceito_doutorado == 120.5
      assert igc.conceito_graduacao == 120.5
      assert igc.conceito_mestrado == 120.5
      assert igc.gama_proporcao_doutorando == 120.5
      assert igc.igc_continuo == 120.5
      assert igc.igc_faixa == 42
      assert igc.num_cursos_avaliados == 42
      assert igc.num_cursos_cpc == 42
      assert igc.observacao == "some observacao"
    end

    test "create_igc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Igcs.create_igc(@invalid_attrs)
    end

    test "update_igc/2 with valid data updates the igc" do
      igc = igc_fixture()
      assert {:ok, igc} = Igcs.update_igc(igc, @update_attrs)
      assert %Igc{} = igc
      assert igc.alfa_proporcao_graduandos == 456.7
      assert igc.ano == "some updated ano"
      assert igc.beta_proporcao_mestrandos == 456.7
      assert igc.cod_ies == 43
      assert igc.conceito_doutorado == 456.7
      assert igc.conceito_graduacao == 456.7
      assert igc.conceito_mestrado == 456.7
      assert igc.gama_proporcao_doutorando == 456.7
      assert igc.igc_continuo == 456.7
      assert igc.igc_faixa == 43
      assert igc.num_cursos_avaliados == 43
      assert igc.num_cursos_cpc == 43
      assert igc.observacao == "some updated observacao"
    end

    test "update_igc/2 with invalid data returns error changeset" do
      igc = igc_fixture()
      assert {:error, %Ecto.Changeset{}} = Igcs.update_igc(igc, @invalid_attrs)
      assert igc == Igcs.get_igc!(igc.id)
    end

    test "delete_igc/1 deletes the igc" do
      igc = igc_fixture()
      assert {:ok, %Igc{}} = Igcs.delete_igc(igc)
      assert_raise Ecto.NoResultsError, fn -> Igcs.get_igc!(igc.id) end
    end

    test "change_igc/1 returns a igc changeset" do
      igc = igc_fixture()
      assert %Ecto.Changeset{} = Igcs.change_igc(igc)
    end
  end
end
