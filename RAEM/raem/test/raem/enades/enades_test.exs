defmodule Raem.EnadesTest do
  use Raem.DataCase

  alias Raem.Enades

  describe "enades" do
    alias Raem.Enades.Enade

    @valid_attrs %{ano: ~D[2010-04-17], area: "some area", cod_grupo: 42, cod_ies: 42, cod_municipio: 42, conceito_enade: 42, conceito_idd: 42, media_ce_conc: 120.5, media_ce_ing: 120.5, media_fg_cong: 120.5, media_fg_ing: 120.5, media_geral_conc: 120.5, media_geral_ing: 120.5, municipio: "some municipio", nome_ies: "some nome_ies", sigla_ies: "some sigla_ies", sub_area: "some sub_area", uf: "some uf"}
    @update_attrs %{ano: ~D[2011-05-18], area: "some updated area", cod_grupo: 43, cod_ies: 43, cod_municipio: 43, conceito_enade: 43, conceito_idd: 43, media_ce_conc: 456.7, media_ce_ing: 456.7, media_fg_cong: 456.7, media_fg_ing: 456.7, media_geral_conc: 456.7, media_geral_ing: 456.7, municipio: "some updated municipio", nome_ies: "some updated nome_ies", sigla_ies: "some updated sigla_ies", sub_area: "some updated sub_area", uf: "some updated uf"}
    @invalid_attrs %{ano: nil, area: nil, cod_grupo: nil, cod_ies: nil, cod_municipio: nil, conceito_enade: nil, conceito_idd: nil, media_ce_conc: nil, media_ce_ing: nil, media_fg_cong: nil, media_fg_ing: nil, media_geral_conc: nil, media_geral_ing: nil, municipio: nil, nome_ies: nil, sigla_ies: nil, sub_area: nil, uf: nil}

    def enade_fixture(attrs \\ %{}) do
      {:ok, enade} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Enades.create_enade()

      enade
    end

    test "list_enades/0 returns all enades" do
      enade = enade_fixture()
      assert Enades.list_enades() == [enade]
    end

    test "get_enade!/1 returns the enade with given id" do
      enade = enade_fixture()
      assert Enades.get_enade!(enade.id) == enade
    end

    test "create_enade/1 with valid data creates a enade" do
      assert {:ok, %Enade{} = enade} = Enades.create_enade(@valid_attrs)
      assert enade.ano == ~D[2010-04-17]
      assert enade.area == "some area"
      assert enade.cod_grupo == 42
      assert enade.cod_ies == 42
      assert enade.cod_municipio == 42
      assert enade.conceito_enade == 42
      assert enade.conceito_idd == 42
      assert enade.media_ce_conc == 120.5
      assert enade.media_ce_ing == 120.5
      assert enade.media_fg_cong == 120.5
      assert enade.media_fg_ing == 120.5
      assert enade.media_geral_conc == 120.5
      assert enade.media_geral_ing == 120.5
      assert enade.municipio == "some municipio"
      assert enade.nome_ies == "some nome_ies"
      assert enade.sigla_ies == "some sigla_ies"
      assert enade.sub_area == "some sub_area"
      assert enade.uf == "some uf"
    end

    test "create_enade/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enades.create_enade(@invalid_attrs)
    end

    test "update_enade/2 with valid data updates the enade" do
      enade = enade_fixture()
      assert {:ok, enade} = Enades.update_enade(enade, @update_attrs)
      assert %Enade{} = enade
      assert enade.ano == ~D[2011-05-18]
      assert enade.area == "some updated area"
      assert enade.cod_grupo == 43
      assert enade.cod_ies == 43
      assert enade.cod_municipio == 43
      assert enade.conceito_enade == 43
      assert enade.conceito_idd == 43
      assert enade.media_ce_conc == 456.7
      assert enade.media_ce_ing == 456.7
      assert enade.media_fg_cong == 456.7
      assert enade.media_fg_ing == 456.7
      assert enade.media_geral_conc == 456.7
      assert enade.media_geral_ing == 456.7
      assert enade.municipio == "some updated municipio"
      assert enade.nome_ies == "some updated nome_ies"
      assert enade.sigla_ies == "some updated sigla_ies"
      assert enade.sub_area == "some updated sub_area"
      assert enade.uf == "some updated uf"
    end

    test "update_enade/2 with invalid data returns error changeset" do
      enade = enade_fixture()
      assert {:error, %Ecto.Changeset{}} = Enades.update_enade(enade, @invalid_attrs)
      assert enade == Enades.get_enade!(enade.id)
    end

    test "delete_enade/1 deletes the enade" do
      enade = enade_fixture()
      assert {:ok, %Enade{}} = Enades.delete_enade(enade)
      assert_raise Ecto.NoResultsError, fn -> Enades.get_enade!(enade.id) end
    end

    test "change_enade/1 returns a enade changeset" do
      enade = enade_fixture()
      assert %Ecto.Changeset{} = Enades.change_enade(enade)
    end
  end
end
