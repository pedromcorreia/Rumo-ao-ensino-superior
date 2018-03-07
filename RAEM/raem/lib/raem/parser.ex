defmodule Raem.Parser do
  alias Raem.Cpcs.Cpc
  alias Raem.Enades.Enade
  alias Raem.Idds.Idd
  alias Raem.Igcs.Igc
  use Ecto.Schema

  def read_files(file_path) do
    file_path
    |> Enum.map(fn(file) ->
      file
      |> Path.expand()
      |> File.stream!
      |> Stream.map(&(&1))
      |> CSV.decode!(header: true)
      |> Enum.take(2)
      |> csv_list_to_map()
    end)
  end

  defp csv_list_to_map(list) do
    header = List.first(list)
    list
    |> List.delete_at(0)
      |> Enum.map(fn(line) ->
      Enum.zip(header, line)
    end)
  end

  def get_schema_csv(schema_csv) do
    case schema_csv do
      :cpc ->
        cpc_schema = %Cpc{}.__struct__.__schema__(:fields)
      :enade ->
        enade_schema = %Enade{}.__struct__.__schema__(:fields)
      :idd ->
        idd_schema = %Idd{}.__struct__.__schema__(:fields)
      :igc ->
        igc_schema = %Igc{}.__struct__.__schema__(:fields)
    end
  end
end
