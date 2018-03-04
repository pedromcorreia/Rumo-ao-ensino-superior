defmodule RaemWeb.IgcControllerTest do
  use RaemWeb.ConnCase

  alias Raem.Igcs

  @create_attrs %{alfa_proporcao_graduandos: 120.5, ano: ~D[2010-04-17], beta_proporcao_mestrandos: 120.5, cat_administrativa: "some cat_administrativa", cod_ies: 42, conceito_doutorado: 120.5, conceito_graduacao: 120.5, conceito_mestrado: 120.5, gama_proporcao_doutorando: 120.5, igc_continuo: 120.5, igc_faixa: 42, nome_ies: "some nome_ies", num_cursos_avaliados: 42, num_cursos_cpc: 42, observacao: "some observacao", org_academica: "some org_academica", sigla_ies: "some sigla_ies", uf_ies: "some uf_ies"}
  @update_attrs %{alfa_proporcao_graduandos: 456.7, ano: ~D[2011-05-18], beta_proporcao_mestrandos: 456.7, cat_administrativa: "some updated cat_administrativa", cod_ies: 43, conceito_doutorado: 456.7, conceito_graduacao: 456.7, conceito_mestrado: 456.7, gama_proporcao_doutorando: 456.7, igc_continuo: 456.7, igc_faixa: 43, nome_ies: "some updated nome_ies", num_cursos_avaliados: 43, num_cursos_cpc: 43, observacao: "some updated observacao", org_academica: "some updated org_academica", sigla_ies: "some updated sigla_ies", uf_ies: "some updated uf_ies"}
  @invalid_attrs %{alfa_proporcao_graduandos: nil, ano: nil, beta_proporcao_mestrandos: nil, cat_administrativa: nil, cod_ies: nil, conceito_doutorado: nil, conceito_graduacao: nil, conceito_mestrado: nil, gama_proporcao_doutorando: nil, igc_continuo: nil, igc_faixa: nil, nome_ies: nil, num_cursos_avaliados: nil, num_cursos_cpc: nil, observacao: nil, org_academica: nil, sigla_ies: nil, uf_ies: nil}

  def fixture(:igc) do
    {:ok, igc} = Igcs.create_igc(@create_attrs)
    igc
  end

  describe "index" do
    test "lists all igcs", %{conn: conn} do
      conn = get conn, igc_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Igcs"
    end
  end

  describe "new igc" do
    test "renders form", %{conn: conn} do
      conn = get conn, igc_path(conn, :new)
      assert html_response(conn, 200) =~ "New Igc"
    end
  end

  describe "create igc" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, igc_path(conn, :create), igc: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == igc_path(conn, :show, id)

      conn = get conn, igc_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Igc"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, igc_path(conn, :create), igc: @invalid_attrs
      assert html_response(conn, 200) =~ "New Igc"
    end
  end

  describe "edit igc" do
    setup [:create_igc]

    test "renders form for editing chosen igc", %{conn: conn, igc: igc} do
      conn = get conn, igc_path(conn, :edit, igc)
      assert html_response(conn, 200) =~ "Edit Igc"
    end
  end

  describe "update igc" do
    setup [:create_igc]

    test "redirects when data is valid", %{conn: conn, igc: igc} do
      conn = put conn, igc_path(conn, :update, igc), igc: @update_attrs
      assert redirected_to(conn) == igc_path(conn, :show, igc)

      conn = get conn, igc_path(conn, :show, igc)
      assert html_response(conn, 200) =~ "some updated cat_administrativa"
    end

    test "renders errors when data is invalid", %{conn: conn, igc: igc} do
      conn = put conn, igc_path(conn, :update, igc), igc: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Igc"
    end
  end

  describe "delete igc" do
    setup [:create_igc]

    test "deletes chosen igc", %{conn: conn, igc: igc} do
      conn = delete conn, igc_path(conn, :delete, igc)
      assert redirected_to(conn) == igc_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, igc_path(conn, :show, igc)
      end
    end
  end

  defp create_igc(_) do
    igc = fixture(:igc)
    {:ok, igc: igc}
  end
end
