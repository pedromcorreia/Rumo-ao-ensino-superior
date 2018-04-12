defmodule Raem.Mapper do

  alias Raem.Parser

  def map_instituition(map) do
    %{
      cod_ies: Parser.read_field(map, "Cód.IES", :integer),
      nome_ies: Parser.read_field(map, "Nome da IES"),
      sigla_ies: Parser.read_field(map, "Sigla da IES"),
      org_academica: Parser.read_field(map, "Org. Acadêmica"),
      cat_administrativa: Parser.read_field(map, "Categ. Administrativa"),
    }
  end

  def map_igc(map) do
    %{
      cod_ies: Parser.read_field(map, "Cód.IES", :integer),
      ano: Parser.read_field(map, "Ano"),
      num_cursos_cpc: Parser.read_field(map, "Nr. de Cursos com CPC no Triênio", :integer),
      alfa_proporcao_graduandos: Parser.read_field(map, "alfa (Proporção de Graduandos)", :float),
      conceito_graduacao: Parser.read_field(map, "Conceito médio da Graduação", :float),
      beta_proporcao_mestrandos: Parser.read_field(map, "beta (Proporção de Mestrandos - Equivalente)", :float),
      conceito_mestrado: Parser.read_field(map, "Conceito Médio do Mestrado", :float),
      gama_proporcao_doutorando: Parser.read_field(map, "gama (Proporção de Doutorandos - Equivalente)", :float),
      conceito_doutorado: Parser.read_field(map, "Conceito Médio do doutorado", :float),
      igc_continuo: Parser.read_field(map, "IGC (Contínuo)", :float),
      igc_faixa: Parser.read_field(map, "IGC (faixa)", :integer),
    }
  end

  def map_course(map) do
    %{
      cod_curso: Parser.read_field(map, "Código do Curso", :integer),
      cod_area: Parser.read_field(map, "Código da Área", :integer),
      cod_ies: Parser.read_field(map, "Código da IES", :integer),
      area_enquadramento: Parser.read_field(map, "Área de Enquadramento"),
      modalidade_ensino: Parser.read_field(map, "Modalidade de Ensino"),
      cod_municipio: Parser.read_field(map, "Código do Município", :integer),
      municipio_curso: Parser.read_field(map, "Município do Curso"),
      sigla_uf: Parser.read_field(map, "Sigla da UF"),
    }
  end

  def map_cpc(map) do
    %{
      nota_bruta_fg: Parser.read_field(map, "Nota Bruta - FG", :float),
      concluintes_inscritos: Parser.read_field(map, "Concluintes Inscritos", :integer),
      nota_padronizada_iif: Parser.read_field(map, "Nota Bruta - Infraestrutura e Instalações Físicas", :float),
      nota_bruta_doutores: Parser.read_field(map, "Nota Bruta - Doutores", :float),
      nota_continua_enade: Parser.read_field(map, "Nota Contínua do Enade", :float),
      nota_padronizada_odp: Parser.read_field(map, "Nota Padronizada - Organização Didático-Pedagógica", :float),
      nota_padronizada_oaf: Parser.read_field(map, "Nota Padronizada - Oportunidades de Ampliação da Formação", :float),
      ano: Parser.read_field(map, "Ano Enade"),
      nota_padronizada_mestres: Parser.read_field(map, "Nota Padronizada - Mestres", :float),
      nota_bruta_mestres: Parser.read_field(map, "Nota Bruta - Mestres", :float),
      nota_bruta_oaf: Parser.read_field(map, "Nota Bruta - Oportunidades de Ampliação da Formação", :float),
      nota_padronizada_regime_trabalho: Parser.read_field(map, "Nota Padronizada - Regime de Trabalho", :float),
      cpc_faixa: Parser.read_field(map, "CPC Faixa", :integer),
      nota_padronizada_doutores: Parser.read_field(map, "Nota Padronizada - Doutores", :float),
      concluintes_participantes: Parser.read_field(map, "Concluintes Participantes", :integer),
      num_docentes: Parser.read_field(map, "Nr. de Docentes", :integer),
      concluintes_participantes_enem: Parser.read_field(map, "Concluintes Participantes com nota no Enem", :integer),
      cpc_continuo: Parser.read_field(map, "CPC Contínuo", :float),
      percentual_concluintes_enem: Parser.read_field(map, "Percentual de Concluintes participantes com nota no Enem", :float),
      nota_bruta_regime_trabalho: Parser.read_field(map, "Nota Bruta - Regime de Trabalho", :float),
      nota_bruta_odp: Parser.read_field(map, "Nota Bruta - Organização Didático-Pedagógica", :float),
      nota_bruta_idd: Parser.read_field(map, "Nota Bruta - IDD", :float),
      nota_bruta_ce: Parser.read_field(map, "Nota Bruta - CE", :float),
      nota_padronizada_idd: Parser.read_field(map, "Nota Padronizada - IDD", :float),
    }
  end
end
