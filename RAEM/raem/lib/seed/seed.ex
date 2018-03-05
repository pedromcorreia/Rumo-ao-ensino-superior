defmodule Mix.Tasks.Raem.Seed do
  @shortdoc "Seeds the dataset"

  use Mix.Task
  alias Raem.Repo
  alias Raem.Cpcs
  alias Raem.Cpcs.Cpc
  alias Seed.Miner

  import Ecto

  @doc false
  def run(args) do

    {opts, args, _} = OptionParser.parse(args, switches: [org: :integer, pool_size: :integer])

    unless opts[:base] do
      Mix.raise("""
You must give us an org id to insert the contracts. Like this:
mix raem.seed --base=enade
""")
    end

    Mix.Task.run "app.start", []

    ctx = String.to_atom(opts[:base])

    ("~/Documents/Capes/CPC/2008_cpc.csv")
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.map(&(&1))
    |> CSV.decode(separator: ?,)
    |> Enum.drop(1)
    |> Enum.take(2)
    |> Miner.csv_list_to_map(:cpc)

  end
end
