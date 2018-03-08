defmodule Mix.Tasks.Seed do
  @shortdoc "Seeds the dataset"

  use Mix.Task
  alias Raem.Parser

  import Ecto

  @doc false
  def run(_args) do
    "resources/IDD/*.{csv}"
    |> Path.wildcard
    |> Parser.read_files
    |> IO.inspect()
  end
end
