defmodule RaemWeb.IddControllerTest do
  use RaemWeb.ConnCase

  alias Raem.Idds

  @create_attrs %{ano: ~D[2010-04-17], area_enquadramento: "some area_enquadramento", cat_administrativa: "some cat_administrativa", cod_area: 42, cod_curso: 42, cod_ies: 42, cod_municipio: 42, concluintes_inscritos: 42, concluintes_participantes: 42, concluintes_participantes_enem: 42, idd_faixa: 42, modalidade_ensino: "some modalidade_ensino", municipio_curso: "some municipio_curso", nome_ies: "some nome_ies", nota_bruta_idd: 120.5, nota_padronizada_idd: 120.5, org_academica: "some org_academica", percentual_concluintes_participantes_enem: 120.5, sigla_ies: "some sigla_ies", sigla_uf: "some sigla_uf"}
  @update_attrs %{ano: ~D[2011-05-18], area_enquadramento: "some updated area_enquadramento", cat_administrativa: "some updated cat_administrativa", cod_area: 43, cod_curso: 43, cod_ies: 43, cod_municipio: 43, concluintes_inscritos: 43, concluintes_participantes: 43, concluintes_participantes_enem: 43, idd_faixa: 43, modalidade_ensino: "some updated modalidade_ensino", municipio_curso: "some updated municipio_curso", nome_ies: "some updated nome_ies", nota_bruta_idd: 456.7, nota_padronizada_idd: 456.7, org_academica: "some updated org_academica", percentual_concluintes_participantes_enem: 456.7, sigla_ies: "some updated sigla_ies", sigla_uf: "some updated sigla_uf"}
  @invalid_attrs %{ano: nil, area_enquadramento: nil, cat_administrativa: nil, cod_area: nil, cod_curso: nil, cod_ies: nil, cod_municipio: nil, concluintes_inscritos: nil, concluintes_participantes: nil, concluintes_participantes_enem: nil, idd_faixa: nil, modalidade_ensino: nil, municipio_curso: nil, nome_ies: nil, nota_bruta_idd: nil, nota_padronizada_idd: nil, org_academica: nil, percentual_concluintes_participantes_enem: nil, sigla_ies: nil, sigla_uf: nil}

  def fixture(:idd) do
    {:ok, idd} = Idds.create_idd(@create_attrs)
    idd
  end

  describe "index" do
    test "lists all idds", %{conn: conn} do
      conn = get conn, idd_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Idds"
    end
  end

  describe "new idd" do
    test "renders form", %{conn: conn} do
      conn = get conn, idd_path(conn, :new)
      assert html_response(conn, 200) =~ "New Idd"
    end
  end

  describe "create idd" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, idd_path(conn, :create), idd: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == idd_path(conn, :show, id)

      conn = get conn, idd_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Idd"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, idd_path(conn, :create), idd: @invalid_attrs
      assert html_response(conn, 200) =~ "New Idd"
    end
  end

  describe "edit idd" do
    setup [:create_idd]

    test "renders form for editing chosen idd", %{conn: conn, idd: idd} do
      conn = get conn, idd_path(conn, :edit, idd)
      assert html_response(conn, 200) =~ "Edit Idd"
    end
  end

  describe "update idd" do
    setup [:create_idd]

    test "redirects when data is valid", %{conn: conn, idd: idd} do
      conn = put conn, idd_path(conn, :update, idd), idd: @update_attrs
      assert redirected_to(conn) == idd_path(conn, :show, idd)

      conn = get conn, idd_path(conn, :show, idd)
      assert html_response(conn, 200) =~ "some updated area_enquadramento"
    end

    test "renders errors when data is invalid", %{conn: conn, idd: idd} do
      conn = put conn, idd_path(conn, :update, idd), idd: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Idd"
    end
  end

  describe "delete idd" do
    setup [:create_idd]

    test "deletes chosen idd", %{conn: conn, idd: idd} do
      conn = delete conn, idd_path(conn, :delete, idd)
      assert redirected_to(conn) == idd_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, idd_path(conn, :show, idd)
      end
    end
  end

  defp create_idd(_) do
    idd = fixture(:idd)
    {:ok, idd: idd}
  end
end
