defmodule Raem.Parser do
  use Ecto.Schema

  alias NimbleCSV.RFC4180, as: CSV

  def parse(path, list_or_stream \\ :list)

  def parse(path, :stream) do
    header = path |> header() |> List.to_tuple()

    path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.map(fn row_values ->
      row_values
      |> Stream.with_index()
      |> Stream.map(fn {v, i} -> {elem(header, i), v} end)
      |> Enum.to_list()
      |> Map.new()
    end)
  end

  def parse(path, :list) do
    path
    |> parse(:stream)
    |> Enum.to_list()
  end

  defp header(path) do
    path
    |> File.stream!()
    |> CSV.parse_stream(headers: false)
    |> Stream.take(1)
    |> Enum.to_list()
    |> List.first()
  end

  def read_field(data, field) do
    Map.get(data, field)
  end
  def read_field(data, field, :float) do
    result = Float.parse(read_field(data, field))
    result
    |> case do
      :error -> 0.0
      _ -> elem(result, 0)
    end
  end
  def read_field(data, field, :integer) do
    result = Integer.parse(read_field(data, field))
    result
    |> case do
      :error -> 0
      _ -> elem(result, 0)
    end
  end
end
