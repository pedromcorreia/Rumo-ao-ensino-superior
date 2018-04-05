defmodule RaemWeb.InstituicaoControllerTest do
  use RaemWeb.ConnCase

  alias Raem.Instituicoes

  @create_attrs %{cat_administratica: "some cat_administratica", cod_ies: 42, nome_ies: "some nome_ies", org_academica: "some org_academica", sigla_ies: "some sigla_ies"}
  @update_attrs %{cat_administratica: "some updated cat_administratica", cod_ies: 43, nome_ies: "some updated nome_ies", org_academica: "some updated org_academica", sigla_ies: "some updated sigla_ies"}
  @invalid_attrs %{cat_administratica: nil, cod_ies: nil, nome_ies: nil, org_academica: nil, sigla_ies: nil}

  def fixture(:instituicao) do
    {:ok, instituicao} = Instituicoes.create_instituicao(@create_attrs)
    instituicao
  end

  describe "index" do
    test "lists all instituicoes", %{conn: conn} do
      conn = get conn, instituicao_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Instituicoes"
    end
  end

  describe "new instituicao" do
    test "renders form", %{conn: conn} do
      conn = get conn, instituicao_path(conn, :new)
      assert html_response(conn, 200) =~ "New Instituicao"
    end
  end

  describe "create instituicao" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, instituicao_path(conn, :create), instituicao: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == instituicao_path(conn, :show, id)

      conn = get conn, instituicao_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Instituicao"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, instituicao_path(conn, :create), instituicao: @invalid_attrs
      assert html_response(conn, 200) =~ "New Instituicao"
    end
  end

  describe "edit instituicao" do
    setup [:create_instituicao]

    test "renders form for editing chosen instituicao", %{conn: conn, instituicao: instituicao} do
      conn = get conn, instituicao_path(conn, :edit, instituicao)
      assert html_response(conn, 200) =~ "Edit Instituicao"
    end
  end

  describe "update instituicao" do
    setup [:create_instituicao]

    test "redirects when data is valid", %{conn: conn, instituicao: instituicao} do
      conn = put conn, instituicao_path(conn, :update, instituicao), instituicao: @update_attrs
      assert redirected_to(conn) == instituicao_path(conn, :show, instituicao)

      conn = get conn, instituicao_path(conn, :show, instituicao)
      assert html_response(conn, 200) =~ "some updated cat_administratica"
    end

    test "renders errors when data is invalid", %{conn: conn, instituicao: instituicao} do
      conn = put conn, instituicao_path(conn, :update, instituicao), instituicao: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Instituicao"
    end
  end

  describe "delete instituicao" do
    setup [:create_instituicao]

    test "deletes chosen instituicao", %{conn: conn, instituicao: instituicao} do
      conn = delete conn, instituicao_path(conn, :delete, instituicao)
      assert redirected_to(conn) == instituicao_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, instituicao_path(conn, :show, instituicao)
      end
    end
  end

  defp create_instituicao(_) do
    instituicao = fixture(:instituicao)
    {:ok, instituicao: instituicao}
  end
end
