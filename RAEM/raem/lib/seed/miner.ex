defmodule Seed.Miner do
  alias Raem.Cpcs.Cpc
  alias Raem.Enades.Enade
  alias Raem.Idds.Idd
  alias Raem.Igcs.Igc
  use Ecto.Schema

  def csv_list_to_map(list, schema_csv) do
    case schema_csv do
      :cpc ->
        cpc_schema = %Cpc{}.__struct__.__schema__(:fields)

        header = List.first(list)

        list
        |> List.delete_at(0)
        |> Enum.all?(fn(line) ->
          line
          |> Enum.each(fn(el) ->
            IO.puts el
            |> concat_header_result(header)
          end)
        end)
      :enade ->
        enade_schema = %Enade{}.__struct__.__schema__(:fields)
      :idd ->
        idd_schema = %Idd{}.__struct__.__schema__(:fields)
      :igc ->
        igc_schema = %Igc{}.__struct__.__schema__(:fields)
    end
  end

  defp concat_header_result(list_result, header) do
    IO.inspect(list_result, label: "list")
    IO.inspect(header, label: "header")
  end
end
