defmodule Seed.Miner do
  alias Raem.Cpcs.Cpc
  alias Raem.Enades.Enade
  alias Raem.Idds.Idd
  alias Raem.Igcs.Igc
  use Ecto.Schema

  def csv_list_to_map(list, schema_csv) do
      header = List.first(list)
      list
      |> List.delete_at(0)
      |> Enum.all?(fn(line) ->
        header
        |> Enum.zip(line)
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
