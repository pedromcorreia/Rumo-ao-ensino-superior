defmodule Raem.CpcsTest do
  use Raem.DataCase

  alias Raem.Cpcs

  describe "cpcs" do
    alias Raem.Cpcs.Cpc

    @valid_attrs %{mun_curso: "some mun_curso", cod_ies: 42, nota_bruta_fg: 120.5, regiao_curso: "some regiao_curso", concluintes_inscritos: 42, nota_bruta_geral: 120.5, nota_padronizada_iif: 120.5, nota_bruta_doutores: 120.5, cat_administrativa: "some cat_administrativa", nome_ies: "some nome_ies", org_academica: "some org_academica", cod_area: 42, nota_continua_enade: 120.5, nota_padronizada_odp: 120.5, nota_padronizada_oaf: 120.5, ano: ~D[2010-04-17], num_cursos_unidade: 42, area_enquadramento: "some area_enquadramento", num_matriculas: 42, nota_padronizada_mestres: 120.5, nota_bruta_mestres: 120.5, nota_bruta_oaf: 120.5, observacao: "some observacao", sigla_ies: "some sigla_ies", nota_padronizada_regime_trabalho: 120.5, cpc_faixa: 42, cod_municipio: 42, nota_padronizada_doutores: 120.5, concluintes_participantes: 42, uf_curso: "some uf_curso", num_docentes: 42, concluintes_participantes_enem: 42, cpc_continuo: 120.5, percentual_concluintes_enem: 120.5, nota_bruta_regime_trabalho: 120.5, nota_bruta_odp: 120.5, nota_bruta_idd: 120.5, nota_bruta_ce: 120.5, nota_padronizada_idd: 120.5}
    @update_attrs %{mun_curso: "some updated mun_curso", cod_ies: 43, nota_bruta_fg: 456.7, regiao_curso: "some updated regiao_curso", concluintes_inscritos: 43, nota_bruta_geral: 456.7, nota_padronizada_iif: 456.7, nota_bruta_doutores: 456.7, cat_administrativa: "some updated cat_administrativa", nome_ies: "some updated nome_ies", org_academica: "some updated org_academica", cod_area: 43, nota_continua_enade: 456.7, nota_padronizada_odp: 456.7, nota_padronizada_oaf: 456.7, ano: ~D[2011-05-18], num_cursos_unidade: 43, area_enquadramento: "some updated area_enquadramento", num_matriculas: 43, nota_padronizada_mestres: 456.7, nota_bruta_mestres: 456.7, nota_bruta_oaf: 456.7, observacao: "some updated observacao", sigla_ies: "some updated sigla_ies", nota_padronizada_regime_trabalho: 456.7, cpc_faixa: 43, cod_municipio: 43, nota_padronizada_doutores: 456.7, concluintes_participantes: 43, uf_curso: "some updated uf_curso", num_docentes: 43, concluintes_participantes_enem: 43, cpc_continuo: 456.7, percentual_concluintes_enem: 456.7, nota_bruta_regime_trabalho: 456.7, nota_bruta_odp: 456.7, nota_bruta_idd: 456.7, nota_bruta_ce: 456.7, nota_padronizada_idd: 456.7}
    @invalid_attrs %{mun_curso: nil, cod_ies: nil, nota_bruta_fg: nil, regiao_curso: nil, concluintes_inscritos: nil, nota_bruta_geral: nil, nota_padronizada_iif: nil, nota_bruta_doutores: nil, cat_administrativa: nil, nome_ies: nil, org_academica: nil, cod_area: nil, nota_continua_enade: nil, nota_padronizada_odp: nil, nota_padronizada_oaf: nil, ano: nil, num_cursos_unidade: nil, area_enquadramento: nil, num_matriculas: nil, nota_padronizada_mestres: nil, nota_bruta_mestres: nil, nota_bruta_oaf: nil, observacao: nil, sigla_ies: nil, nota_padronizada_regime_trabalho: nil, cpc_faixa: nil, cod_municipio: nil, nota_padronizada_doutores: nil, concluintes_participantes: nil, uf_curso: nil, num_docentes: nil, concluintes_participantes_enem: nil, cpc_continuo: nil, percentual_concluintes_enem: nil, nota_bruta_regime_trabalho: nil, nota_bruta_odp: nil, nota_bruta_idd: nil, nota_bruta_ce: nil, nota_padronizada_idd: nil}

    def cpc_fixture(attrs \\ %{}) do
      {:ok, cpc} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cpcs.create_cpc()

      cpc
    end

    test "list_cpcs/0 returns all cpcs" do
      cpc = cpc_fixture()
      assert Cpcs.list_cpcs() == [cpc]
    end

    test "get_cpc!/1 returns the cpc with given id" do
      cpc = cpc_fixture()
      assert Cpcs.get_cpc!(cpc.id) == cpc
    end

    test "create_cpc/1 with valid data creates a cpc" do
      assert {:ok, %Cpc{} = cpc} = Cpcs.create_cpc(@valid_attrs)
      assert cpc.mun_curso == "some mun_curso"
      assert cpc.cod_ies == 42
      assert cpc.nota_bruta_fg == 120.5
      assert cpc.regiao_curso == "some regiao_curso"
      assert cpc.concluintes_inscritos == 42
      assert cpc.nota_bruta_geral == 120.5
      assert cpc.nota_padronizada_iif == 120.5
      assert cpc.nota_bruta_doutores == 120.5
      assert cpc.cat_administrativa == "some cat_administrativa"
      assert cpc.nome_ies == "some nome_ies"
      assert cpc.org_academica == "some org_academica"
      assert cpc.cod_area == 42
      assert cpc.nota_continua_enade == 120.5
      assert cpc.nota_padronizada_odp == 120.5
      assert cpc.nota_padronizada_oaf == 120.5
      assert cpc.ano == ~D[2010-04-17]
      assert cpc.num_cursos_unidade == 42
      assert cpc.area_enquadramento == "some area_enquadramento"
      assert cpc.num_matriculas == 42
      assert cpc.nota_padronizada_mestres == 120.5
      assert cpc.nota_bruta_mestres == 120.5
      assert cpc.nota_bruta_oaf == 120.5
      assert cpc.observacao == "some observacao"
      assert cpc.sigla_ies == "some sigla_ies"
      assert cpc.nota_padronizada_regime_trabalho == 120.5
      assert cpc.cpc_faixa == 42
      assert cpc.cod_municipio == 42
      assert cpc.nota_padronizada_doutores == 120.5
      assert cpc.concluintes_participantes == 42
      assert cpc.uf_curso == "some uf_curso"
      assert cpc.num_docentes == 42
      assert cpc.concluintes_participantes_enem == 42
      assert cpc.cpc_continuo == 120.5
      assert cpc.percentual_concluintes_enem == 120.5
      assert cpc.nota_bruta_regime_trabalho == 120.5
      assert cpc.nota_bruta_odp == 120.5
      assert cpc.nota_bruta_idd == 120.5
      assert cpc.nota_bruta_ce == 120.5
      assert cpc.nota_padronizada_idd == 120.5
    end

    test "create_cpc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cpcs.create_cpc(@invalid_attrs)
    end

    test "update_cpc/2 with valid data updates the cpc" do
      cpc = cpc_fixture()
      assert {:ok, cpc} = Cpcs.update_cpc(cpc, @update_attrs)
      assert %Cpc{} = cpc
      assert cpc.mun_curso == "some updated mun_curso"
      assert cpc.cod_ies == 43
      assert cpc.nota_bruta_fg == 456.7
      assert cpc.regiao_curso == "some updated regiao_curso"
      assert cpc.concluintes_inscritos == 43
      assert cpc.nota_bruta_geral == 456.7
      assert cpc.nota_padronizada_iif == 456.7
      assert cpc.nota_bruta_doutores == 456.7
      assert cpc.cat_administrativa == "some updated cat_administrativa"
      assert cpc.nome_ies == "some updated nome_ies"
      assert cpc.org_academica == "some updated org_academica"
      assert cpc.cod_area == 43
      assert cpc.nota_continua_enade == 456.7
      assert cpc.nota_padronizada_odp == 456.7
      assert cpc.nota_padronizada_oaf == 456.7
      assert cpc.ano == ~D[2011-05-18]
      assert cpc.num_cursos_unidade == 43
      assert cpc.area_enquadramento == "some updated area_enquadramento"
      assert cpc.num_matriculas == 43
      assert cpc.nota_padronizada_mestres == 456.7
      assert cpc.nota_bruta_mestres == 456.7
      assert cpc.nota_bruta_oaf == 456.7
      assert cpc.observacao == "some updated observacao"
      assert cpc.sigla_ies == "some updated sigla_ies"
      assert cpc.nota_padronizada_regime_trabalho == 456.7
      assert cpc.cpc_faixa == 43
      assert cpc.cod_municipio == 43
      assert cpc.nota_padronizada_doutores == 456.7
      assert cpc.concluintes_participantes == 43
      assert cpc.uf_curso == "some updated uf_curso"
      assert cpc.num_docentes == 43
      assert cpc.concluintes_participantes_enem == 43
      assert cpc.cpc_continuo == 456.7
      assert cpc.percentual_concluintes_enem == 456.7
      assert cpc.nota_bruta_regime_trabalho == 456.7
      assert cpc.nota_bruta_odp == 456.7
      assert cpc.nota_bruta_idd == 456.7
      assert cpc.nota_bruta_ce == 456.7
      assert cpc.nota_padronizada_idd == 456.7
    end

    test "update_cpc/2 with invalid data returns error changeset" do
      cpc = cpc_fixture()
      assert {:error, %Ecto.Changeset{}} = Cpcs.update_cpc(cpc, @invalid_attrs)
      assert cpc == Cpcs.get_cpc!(cpc.id)
    end

    test "delete_cpc/1 deletes the cpc" do
      cpc = cpc_fixture()
      assert {:ok, %Cpc{}} = Cpcs.delete_cpc(cpc)
      assert_raise Ecto.NoResultsError, fn -> Cpcs.get_cpc!(cpc.id) end
    end

    test "change_cpc/1 returns a cpc changeset" do
      cpc = cpc_fixture()
      assert %Ecto.Changeset{} = Cpcs.change_cpc(cpc)
    end
  end
end
