defmodule Mix.Tasks.Seed do
  @shortdoc "Seeds the dataset"

  use Mix.Task
  alias Raem.Parser
  alias Raem.Idds.Idd

  import Ecto

  @doc false
  def run(_args) do
    "resources/IDD/*.{csv}"
    |> Path.wildcard
    |> Parser.read_files
    |> Enum.map(fn(list_readed) ->
      list_readed
      |> Enum.map(fn(file_readed) ->
        file_readed
        #|> Idd.create_idd
      end)
    end)

    IO.inspect(%Idd{}.__struct__.__schema__(:fields))
  end
end
