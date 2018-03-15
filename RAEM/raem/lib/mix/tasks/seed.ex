defmodule Mix.Tasks.Seed do
  @shortdoc """

  Mix for seed the dataset
  Receives a path of resources

  """
  use Mix.Task

  alias Raem.Parser
  alias Raem.Mapping.{Idd, Igc, Enade, Cpc}


  @doc """
  Run the seed
  And insert in the database
  By default get path from resources

  ## Examples

  -> mix.seed

  """

  def run(_args) do
    #TODO change the default dir_name
    #This above is set to run tests
    default_dir_name = "resources/"

    path = default_dir_name <> "IDD/*.{csv}"

    #:struct = get_struct(path)
    path
    |> Path.wildcard()
    |> Parser.parse(:stream)
    |> Enum.map(fn(row) ->
      row
      |> IO.inspect
      #Create.insert(struct)
    end)
  end

  defp get_struct(path) do
    struct =
      path
      |> case do
        :IDD ->
          Idd.build()
        :IGC ->
          IGC.build()
        :ENADE ->
          ENADE.build()
        :CPC ->
          CPC.build()
      end
  end
end
