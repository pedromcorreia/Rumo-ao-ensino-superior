defmodule Mix.Tasks.Raem.Seed do
  @shortdoc "Seeds the dataset"

  use Mix.Task
  alias Raem.Repo
  alias Raem.Cpcs
  alias Raem.Cpcs.Cpc
  alias Seed.Miner

  import Ecto

  @doc false
  def run(_args) do
    "resources/**/*.{csv}"
    |> Path.wildcard
    |> Miner.read_files
  end
end
