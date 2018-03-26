defmodule Raem.Mappings.Idd do

  alias Raem.Idds.Idd

  @mappings %{}
  def build(%Idd{} = idd) do
    raw_type = read_field(idd.metadata, :type)
    %{
      ano: nil,
      area_enquadramento: nil,
      cat_administrativa: nil,
      cod_area: nil,
      cod_curso: nil,
      cod_ies: nil,
      cod_municipio: nil,
      concluintes_inscritos: nil,
      concluintes_participantes: nil,
      concluintes_participantes_enem: nil,
      idd_faixa: nil,
      modalidade_ensino: nil,
      municipio_curso: nil,
      nome_ies: nil,
      nota_bruta_idd: nil,
      nota_padronizada_idd: nil,
      org_academica: nil,
      percentual_concluintes_participantes_enem: nil,
      sigla_ies: nil,
      sigla_uf: nil,
    }
  end

  def read_field(data, field, default \\ nil) do
    if Map.has_key?(@mappings, field) do
      mapping = field
      read_mapped_field(data, mapping.field, mapping.type, default)
    end
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
