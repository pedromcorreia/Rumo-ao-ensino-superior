defmodule RaemWeb.EnadeControllerTest do
  use RaemWeb.ConnCase

  alias Raem.Enades

  @create_attrs %{ano: ~D[2010-04-17], area: "some area", cod_grupo: 42, cod_ies: 42, cod_municipio: 42, conceito_enade: 42, conceito_idd: 42, media_ce_conc: 120.5, media_ce_ing: 120.5, media_fg_cong: 120.5, media_fg_ing: 120.5, media_geral_conc: 120.5, media_geral_ing: 120.5, municipio: "some municipio", nome_ies: "some nome_ies", sigla_ies: "some sigla_ies", sub_area: "some sub_area", uf: "some uf"}
  @update_attrs %{ano: ~D[2011-05-18], area: "some updated area", cod_grupo: 43, cod_ies: 43, cod_municipio: 43, conceito_enade: 43, conceito_idd: 43, media_ce_conc: 456.7, media_ce_ing: 456.7, media_fg_cong: 456.7, media_fg_ing: 456.7, media_geral_conc: 456.7, media_geral_ing: 456.7, municipio: "some updated municipio", nome_ies: "some updated nome_ies", sigla_ies: "some updated sigla_ies", sub_area: "some updated sub_area", uf: "some updated uf"}
  @invalid_attrs %{ano: nil, area: nil, cod_grupo: nil, cod_ies: nil, cod_municipio: nil, conceito_enade: nil, conceito_idd: nil, media_ce_conc: nil, media_ce_ing: nil, media_fg_cong: nil, media_fg_ing: nil, media_geral_conc: nil, media_geral_ing: nil, municipio: nil, nome_ies: nil, sigla_ies: nil, sub_area: nil, uf: nil}

  def fixture(:enade) do
    {:ok, enade} = Enades.create_enade(@create_attrs)
    enade
  end

  describe "index" do
    test "lists all enades", %{conn: conn} do
      conn = get conn, enade_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Enades"
    end
  end

  describe "new enade" do
    test "renders form", %{conn: conn} do
      conn = get conn, enade_path(conn, :new)
      assert html_response(conn, 200) =~ "New Enade"
    end
  end

  describe "create enade" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, enade_path(conn, :create), enade: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == enade_path(conn, :show, id)

      conn = get conn, enade_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Enade"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, enade_path(conn, :create), enade: @invalid_attrs
      assert html_response(conn, 200) =~ "New Enade"
    end
  end

  describe "edit enade" do
    setup [:create_enade]

    test "renders form for editing chosen enade", %{conn: conn, enade: enade} do
      conn = get conn, enade_path(conn, :edit, enade)
      assert html_response(conn, 200) =~ "Edit Enade"
    end
  end

  describe "update enade" do
    setup [:create_enade]

    test "redirects when data is valid", %{conn: conn, enade: enade} do
      conn = put conn, enade_path(conn, :update, enade), enade: @update_attrs
      assert redirected_to(conn) == enade_path(conn, :show, enade)

      conn = get conn, enade_path(conn, :show, enade)
      assert html_response(conn, 200) =~ "some updated area"
    end

    test "renders errors when data is invalid", %{conn: conn, enade: enade} do
      conn = put conn, enade_path(conn, :update, enade), enade: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Enade"
    end
  end

  describe "delete enade" do
    setup [:create_enade]

    test "deletes chosen enade", %{conn: conn, enade: enade} do
      conn = delete conn, enade_path(conn, :delete, enade)
      assert redirected_to(conn) == enade_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, enade_path(conn, :show, enade)
      end
    end
  end

  defp create_enade(_) do
    enade = fixture(:enade)
    {:ok, enade: enade}
  end
end
