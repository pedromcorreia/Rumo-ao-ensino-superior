defmodule RaemWeb.CpcControllerTest do
  use RaemWeb.ConnCase

  alias Raem.Cpcs

  @create_attrs %{mun_curso: "some mun_curso", cod_ies: 42, nota_bruta_fg: 120.5, regiao_curso: "some regiao_curso", concluintes_inscritos: 42, nota_bruta_geral: 120.5, nota_padronizada_iif: 120.5, nota_bruta_doutores: 120.5, cat_administrativa: "some cat_administrativa", nome_ies: "some nome_ies", org_academica: "some org_academica", cod_area: 42, nota_continua_enade: 120.5, nota_padronizada_odp: 120.5, nota_padronizada_oaf: 120.5, ano: ~D[2010-04-17], num_cursos_unidade: 42, area_enquadramento: "some area_enquadramento", num_matriculas: 42, nota_padronizada_mestres: 120.5, nota_bruta_mestres: 120.5, nota_bruta_oaf: 120.5, observacao: "some observacao", sigla_ies: "some sigla_ies", nota_padronizada_regime_trabalho: 120.5, cpc_faixa: 42, cod_municipio: 42, nota_padronizada_doutores: 120.5, concluintes_participantes: 42, uf_curso: "some uf_curso", num_docentes: 42, concluintes_participantes_enem: 42, cpc_continuo: 120.5, percentual_concluintes_enem: 120.5, nota_bruta_regime_trabalho: 120.5, nota_bruta_odp: 120.5, nota_bruta_idd: 120.5, nota_bruta_ce: 120.5, nota_padronizada_idd: 120.5}
  @update_attrs %{mun_curso: "some updated mun_curso", cod_ies: 43, nota_bruta_fg: 456.7, regiao_curso: "some updated regiao_curso", concluintes_inscritos: 43, nota_bruta_geral: 456.7, nota_padronizada_iif: 456.7, nota_bruta_doutores: 456.7, cat_administrativa: "some updated cat_administrativa", nome_ies: "some updated nome_ies", org_academica: "some updated org_academica", cod_area: 43, nota_continua_enade: 456.7, nota_padronizada_odp: 456.7, nota_padronizada_oaf: 456.7, ano: ~D[2011-05-18], num_cursos_unidade: 43, area_enquadramento: "some updated area_enquadramento", num_matriculas: 43, nota_padronizada_mestres: 456.7, nota_bruta_mestres: 456.7, nota_bruta_oaf: 456.7, observacao: "some updated observacao", sigla_ies: "some updated sigla_ies", nota_padronizada_regime_trabalho: 456.7, cpc_faixa: 43, cod_municipio: 43, nota_padronizada_doutores: 456.7, concluintes_participantes: 43, uf_curso: "some updated uf_curso", num_docentes: 43, concluintes_participantes_enem: 43, cpc_continuo: 456.7, percentual_concluintes_enem: 456.7, nota_bruta_regime_trabalho: 456.7, nota_bruta_odp: 456.7, nota_bruta_idd: 456.7, nota_bruta_ce: 456.7, nota_padronizada_idd: 456.7}
  @invalid_attrs %{mun_curso: nil, cod_ies: nil, nota_bruta_fg: nil, regiao_curso: nil, concluintes_inscritos: nil, nota_bruta_geral: nil, nota_padronizada_iif: nil, nota_bruta_doutores: nil, cat_administrativa: nil, nome_ies: nil, org_academica: nil, cod_area: nil, nota_continua_enade: nil, nota_padronizada_odp: nil, nota_padronizada_oaf: nil, ano: nil, num_cursos_unidade: nil, area_enquadramento: nil, num_matriculas: nil, nota_padronizada_mestres: nil, nota_bruta_mestres: nil, nota_bruta_oaf: nil, observacao: nil, sigla_ies: nil, nota_padronizada_regime_trabalho: nil, cpc_faixa: nil, cod_municipio: nil, nota_padronizada_doutores: nil, concluintes_participantes: nil, uf_curso: nil, num_docentes: nil, concluintes_participantes_enem: nil, cpc_continuo: nil, percentual_concluintes_enem: nil, nota_bruta_regime_trabalho: nil, nota_bruta_odp: nil, nota_bruta_idd: nil, nota_bruta_ce: nil, nota_padronizada_idd: nil}

  def fixture(:cpc) do
    {:ok, cpc} = Cpcs.create_cpc(@create_attrs)
    cpc
  end

  describe "index" do
    test "lists all cpcs", %{conn: conn} do
      conn = get conn, cpc_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Cpcs"
    end
  end

  describe "new cpc" do
    test "renders form", %{conn: conn} do
      conn = get conn, cpc_path(conn, :new)
      assert html_response(conn, 200) =~ "New Cpc"
    end
  end

  describe "create cpc" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, cpc_path(conn, :create), cpc: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == cpc_path(conn, :show, id)

      conn = get conn, cpc_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Cpc"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cpc_path(conn, :create), cpc: @invalid_attrs
      assert html_response(conn, 200) =~ "New Cpc"
    end
  end

  describe "edit cpc" do
    setup [:create_cpc]

    test "renders form for editing chosen cpc", %{conn: conn, cpc: cpc} do
      conn = get conn, cpc_path(conn, :edit, cpc)
      assert html_response(conn, 200) =~ "Edit Cpc"
    end
  end

  describe "update cpc" do
    setup [:create_cpc]

    test "redirects when data is valid", %{conn: conn, cpc: cpc} do
      conn = put conn, cpc_path(conn, :update, cpc), cpc: @update_attrs
      assert redirected_to(conn) == cpc_path(conn, :show, cpc)

      conn = get conn, cpc_path(conn, :show, cpc)
      assert html_response(conn, 200) =~ "some updated mun_curso"
    end

    test "renders errors when data is invalid", %{conn: conn, cpc: cpc} do
      conn = put conn, cpc_path(conn, :update, cpc), cpc: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Cpc"
    end
  end

  describe "delete cpc" do
    setup [:create_cpc]

    test "deletes chosen cpc", %{conn: conn, cpc: cpc} do
      conn = delete conn, cpc_path(conn, :delete, cpc)
      assert redirected_to(conn) == cpc_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, cpc_path(conn, :show, cpc)
      end
    end
  end

  defp create_cpc(_) do
    cpc = fixture(:cpc)
    {:ok, cpc: cpc}
  end
end
