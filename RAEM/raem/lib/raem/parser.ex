defmodule Raem.Parser do
  alias Raem.Mapper
  use Ecto.Schema

  def read_files(file_path) do
    file_path
    |> Enum.map(fn(file) ->
      file
      |> File.stream!
      |> Stream.map(&(&1))
      |> CSV.decode!(header: true)
      |> Enum.to_list()
      |> zip_header_and_map()
    end)
  end

  defp zip_header_and_map(list_csv) do
    header_csv = List.first(list_csv)
    list_csv
    |> List.delete_at(0)
    |> Enum.map(fn(line_csv) ->
      Enum.zip(header_csv, line_csv)
    end)
    |> transform_to_fiel_mapped()
  end

  defp transform_to_fiel_mapped(list_zipped) do
    list_zipped
    |> Enum.map(fn(map) ->
      map
      |> Mapper.read_mapped_list()
    end)
  end
end
