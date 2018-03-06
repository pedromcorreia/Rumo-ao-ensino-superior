defmodule Seed.Mapper do
  @moduledoc """
  This module has the functions to map the csv fields to database
  """

  @mappings %{
    ano: %{
      field: "Ano Enade",
      type: :string
    },
    %{
      field: "co_grupo",  type: :string
    },
    cod_ies: %{
      field: "co_ies",
      type: :string
    },
    cod_municipio: %{
      field: "codmunic_inep",
      type: :string
    },
    area_enquadramento: %{
      field: "Área",
      type: :string
    },
    %{
      field: "Sub Area",  type: :string
    },
    %{
      field: "Nome da IES",  type: :string
    },
    mun_curso: %{
      field: "Município (funcionamento do curso)",
      type: :string
    },
    %{
      field: "código UF",  type: :string
    },
    %{
      field: "cd_catad",  type: :string
    },
    %{
      field: "Dep. Administrativa",  type: :string
    },
    %{
      field: "cd_orgac",  type: :string
    },
    %{
      field: "Organização",  type: :string
    },
    regia_curso: %{
      field: "co_regiao_habil",
      type: :string
    },
    %{
      field: "n. alunos presentes Enade",  type: :string
    },
    %{
      field: "Participantes Ingressantes",  type: :string
    },
    concluintes_participantes: %{
      field: "Participantes Concluintes",
      type: :string
    },
    %{
      field: "Média FG_Ing",  type: :string
    },
    %{
      field: "Média FG_Conc",  type: :string
    },
    %{
      field: "Média CE_Ing",  type: :string
    },
    %{
      field: "Média CE_Conc",  type: :string
    },
    %{
      field: "Média Geral Ing",  type: :string
    },
    %{
      field: "Média Geral Conc",  type: :string
    },
    %{
      field: "Conceito_Enade",  type: :string
    },
    %{
      field: "Conceito_IDD",  type: :string
    },
    %{
      field: "Conceito Preliminar Curso",  type: :string
    },
    %{
      field: "CPC Contínuo ",  type: :string
    },
    %{
      field: "% equipamentos disponíveis são suficientes (resp. A/B)",  type: :string
    },
    %{
      field: "% avaliam bem o plano de ensino (resp. A)",  type: :string
    },
    %{
      field: "Número de Docentes",  type: :string
    },
    %{
      field: "Docentes Mestres",  type: :string
    },
    %{
      field: "Docentes Doutores",  type: :string
    },
    %{
      field: "Docentes Regime Parcial/Integral",  type: :string
    },
    %{
      field: "% Docentes Mestres",  type: :string
    },
    %{
      field: "% Docentes Doutores",  type: :string
    },
    %{
      field: "% Docentes Regime Parcial/Integral",  type: :string
    },
    %{
      field: "IDD Índice Auxiliar",  type: :string
    },
    %{
      field: "IDD Índice",  type: :string
    },
    %{
      field: "Nota_infra",  type: :string
    },
    %{
      field: "Nota_pedag",  type: :string
    },
    %{
      field: "Nota_mestre",  type: :string
    },
    %{
      field: "Nota_doutor",  type: :string
    },
    %{
      field: "Nota_regime",  type: :string
    },
    %{
      field: "Nota Enade Ingressantes",  type: :string
    },
    %{
      field: "Nota Enade Concluintes",  type: :string
    },
    %{
      field: "Nota IDD",  type: :string
    }
  }

  def field_mapping(field) do
    @mappings[field]
  end

  def read_field(data, field, default \\ nil) do
    mapping = field_mapping(field)
    read_mapped_field(data, mapping.field, mapping.type, default)
  end

  defp read_mapped_field(data, key, type, default)
  when type in [:string, :raw] do
    Map.get(data, key, default)
  end

  defp read_mapped_field(data, key, :money_cents, default) do
    data
    |> read_mapped_field(key, :float, default)
    |> Kernel.*(100)
    |> Float.floor()
  end

  defp read_mapped_field(data, key, :float, default) do
    data
    |> read_mapped_field(key, :string, default || "0")
    |> Float.parse()
    |> elem(0)
  end

  defp read_mapped_field(data, key, :integer, default) do
    data
    |> read_mapped_field(key, :string, default || "0")
    |> Integer.parse()
    |> elem(0)
  end

  defp read_mapped_field(data, key, :date, default) do
    data
    |> read_mapped_field(key, :string, default)
    |> parse_date()
  end

  def parse_date(date) do
    with date <- String.trim(date),
         [d, m, y] <- String.split(date, "/"),
         {day, _} <- Integer.parse(d),
         month <- month_raw_parse(m),
         {year, _} <- Integer.parse(y),
         {:ok, date} <- Date.new(year, month, day) do
           date
    else
      _ -> nil
         end
  end

  defp month_raw_parse("Jan"), do: 1
  defp month_raw_parse("Fev"), do: 2
  defp month_raw_parse("Mar"), do: 3
  defp month_raw_parse("Abr"), do: 4
  defp month_raw_parse("Mai"), do: 5
  defp month_raw_parse("Jun"), do: 6
  defp month_raw_parse("Jul"), do: 7
  defp month_raw_parse("Ago"), do: 8
  defp month_raw_parse("Set"), do: 9
  defp month_raw_parse("Out"), do: 10
  defp month_raw_parse("Nov"), do: 11
  defp month_raw_parse("Dez"), do: 12
end
