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

  def set_struct(path, default_dir \\ "resources/") do
    path
    |> Path.dirname
    |> String.trim_leading(default_dir)
    |> String.to_atom()
  end
end
