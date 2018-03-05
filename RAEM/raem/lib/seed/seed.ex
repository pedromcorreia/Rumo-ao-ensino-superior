defmodule Mix.Tasks.Raem.Seed do
  @shortdoc "Seeds the dataset"

  use Mix.Task
  alias Raem.Repo
  alias Raem.Cpcs
  alias Raem.Cpcs.Cpc
  alias Seed.Miner

  import Ecto

  @doc false
  def run(_) do
    Mix.Task.run "app.start", []
    seed(Mix.env)
  end

  def seed(:dev) do
    ("~/Documents/Capes/CPC/2008_cpc.csv")
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.map(&(&1))
    |> CSV.decode(separator: ?,)
    |> Enum.drop(1)
    |> Enum.take(1)
    |> IO.inspect
    |> Miner.csv_list_to_map()
  end

  def seed(:prod) do
  end
end
