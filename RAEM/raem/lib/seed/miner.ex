defmodule Seed.Miner do
  alias Raem.Cpcs.Cpc
  alias Raem.Enades.Enade
  alias Raem.Idds.Idd
  alias Raem.Igcs.Igc
  use Ecto.Schema

  def csv_list_to_map(list, schema_csv) do
    case schema_csv do
      :cpc ->
        cpc_schema = (%Cpc{}.__struct__.__schema__(:fields))
        list
        |> Enum.map(fn(line) ->
          {:ok, line_map} = line
          line_map
          |> Stream.map(&(&1))
          |> IO.inspect()
        end)
      :enade ->
        IO.inspect(%Enade{}.__struct__.__schema__(:fields))
      :idd ->
        IO.inspect(%Idd{}.__struct__.__schema__(:fields))
      :igc ->
        IO.inspect(%Igc{}.__struct__.__schema__(:fields))
    end
  end
end
