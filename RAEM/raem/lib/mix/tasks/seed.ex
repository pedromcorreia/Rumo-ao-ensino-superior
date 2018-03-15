defmodule Mix.Tasks.Seed do
  @shortdoc """
  Mix for seed the dataset
  Receives a path of resources
  """
  use Mix.Task
  alias Raem.Parser
  #TODO this is alias for the struct
  #In future change the alias
  alias Raem.Idds.Idd
  alias Raem.Igcs.Igc
  alias Raem.Enades.Enade
  alias Raem.Cpcs.Cpc

  #import Ecto

  @doc """
  Run the seed
  And insert in the database
  By default get path from resources

  ## Examples

  iex> mix.seed

  """


  def run(_args) do
    #TODO change the default dir_name
    #This above is set to run tests

    default_dir_name = "resources/"
    path = default_dir_name <> "IDD/*.{csv}"

    struct =
      path
      |> Parser.set_struct(default_dir_name)
      |> case do
        :IDD ->
          Idd.create_idd()
        :IGC ->
          IGC.create_igc()
        :ENADE ->
          ENADE.create_enade()
        :CPC ->
          CPC.create_cpc()
      end

    path
    |> Path.wildcard
    |> Parser.parse(:stream)
    |> Enum.map(fn(row) ->
      row
    end)
  end
end
