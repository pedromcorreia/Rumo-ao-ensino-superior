defmodule Seed.Miner do
  alias Raem.Cpcs.Cpc
  alias Raem.Enades.Enade
  alias Raem.Idds.Idd
  alias Raem.Igcs.Igc
  use Ecto.Schema

  def csv_list_to_map(list) do
    IO.inspect(%Cpc{}.__struct__.__schema__(:fields))
    IO.inspect(%Enade{}.__struct__.__schema__(:fields))
    IO.inspect(%Idd{}.__struct__.__schema__(:fields))
    IO.inspect(%Igc{}.__struct__.__schema__(:fields))
  end
end
