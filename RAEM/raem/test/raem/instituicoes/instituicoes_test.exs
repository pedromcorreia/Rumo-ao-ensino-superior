defmodule Raem.InstituicoesTest do
  use Raem.DataCase

  alias Raem.Instituicoes

  describe "instituicoes" do
    alias Raem.Instituicoes.Instituicao

    @valid_attrs %{cat_administratica: "some cat_administratica", cod_ies: 42, nome_ies: "some nome_ies", org_academica: "some org_academica", sigla_ies: "some sigla_ies"}
    @update_attrs %{cat_administratica: "some updated cat_administratica", cod_ies: 43, nome_ies: "some updated nome_ies", org_academica: "some updated org_academica", sigla_ies: "some updated sigla_ies"}
    @invalid_attrs %{cat_administratica: nil, cod_ies: nil, nome_ies: nil, org_academica: nil, sigla_ies: nil}

    def instituicao_fixture(attrs \\ %{}) do
      {:ok, instituicao} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Instituicoes.create_instituicao()

      instituicao
    end

    test "list_instituicoes/0 returns all instituicoes" do
      instituicao = instituicao_fixture()
      assert Instituicoes.list_instituicoes() == [instituicao]
    end

    test "get_instituicao!/1 returns the instituicao with given id" do
      instituicao = instituicao_fixture()
      assert Instituicoes.get_instituicao!(instituicao.id) == instituicao
    end

    test "create_instituicao/1 with valid data creates a instituicao" do
      assert {:ok, %Instituicao{} = instituicao} = Instituicoes.create_instituicao(@valid_attrs)
      assert instituicao.cat_administratica == "some cat_administratica"
      assert instituicao.cod_ies == 42
      assert instituicao.nome_ies == "some nome_ies"
      assert instituicao.org_academica == "some org_academica"
      assert instituicao.sigla_ies == "some sigla_ies"
    end

    test "create_instituicao/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instituicoes.create_instituicao(@invalid_attrs)
    end

    test "update_instituicao/2 with valid data updates the instituicao" do
      instituicao = instituicao_fixture()
      assert {:ok, instituicao} = Instituicoes.update_instituicao(instituicao, @update_attrs)
      assert %Instituicao{} = instituicao
      assert instituicao.cat_administratica == "some updated cat_administratica"
      assert instituicao.cod_ies == 43
      assert instituicao.nome_ies == "some updated nome_ies"
      assert instituicao.org_academica == "some updated org_academica"
      assert instituicao.sigla_ies == "some updated sigla_ies"
    end

    test "update_instituicao/2 with invalid data returns error changeset" do
      instituicao = instituicao_fixture()
      assert {:error, %Ecto.Changeset{}} = Instituicoes.update_instituicao(instituicao, @invalid_attrs)
      assert instituicao == Instituicoes.get_instituicao!(instituicao.id)
    end

    test "delete_instituicao/1 deletes the instituicao" do
      instituicao = instituicao_fixture()
      assert {:ok, %Instituicao{}} = Instituicoes.delete_instituicao(instituicao)
      assert_raise Ecto.NoResultsError, fn -> Instituicoes.get_instituicao!(instituicao.id) end
    end

    test "change_instituicao/1 returns a instituicao changeset" do
      instituicao = instituicao_fixture()
      assert %Ecto.Changeset{} = Instituicoes.change_instituicao(instituicao)
    end
  end
end
