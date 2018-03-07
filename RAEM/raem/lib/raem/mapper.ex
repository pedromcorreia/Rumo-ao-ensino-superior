defmodule Raem.Mapper do
  @moduledoc """
  This module has the functions to map the csv fields to database
  """

  @mappings %{
    ano: %{
      field: "Ano Enade",
      type: :string
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
