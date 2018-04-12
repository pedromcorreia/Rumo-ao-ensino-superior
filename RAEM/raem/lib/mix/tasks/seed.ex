defmodule Mix.Tasks.Seed do
  @shortdoc """

  Mix for seed the dataset
  Receives a path of resources

  """
  use Mix.Task
  import Mix.Ecto
  alias Raem.{Igcs, Cpcs, Instituicoes, Parser, Mapper, Cursos}

  @doc """
  Run the seed
  And insert in the database
  By default get path from resources

  ## Examples

  -> mix.seed

  """

  def run(_args) do

    ensure_started(Raem.Repo, [])

    default_dir_name = "resources/"

    # create_instutions(default_dir_name <> "csv/igc_2016.csv")
    #create_igc(default_dir_name <> "csv/igc_2016.csv")
    #create_courses(default_dir_name <> "csv/cpc_2016.csv")
    create_cpc(default_dir_name <> "csv/cpc_2016.csv")
  end

  defp read_path(path) do
    file_read =
      path
      |> Path.wildcard()
      |> Parser.parse(:stream)
  end

  defp create_instutions(path) do
    read_path(path)
    |> Enum.map(fn(row) ->
      row
      |> Mapper.map_instituition()
    end)
    |> Enum.group_by(& &1.cod_ies)
    |> Enum.map(fn {_, instituitions} ->
      List.first(instituitions)
      |> Instituicoes.create_instituicao
    end)
  end

  defp create_igc(path) do
    read_path(path)
    |> Enum.map(fn(row) ->
      row
      |> Mapper.map_igc()
      |> Igcs.create_igc
    end)
  end

  defp create_courses(path) do
    read_path(path)
    |> Enum.map(fn(row) ->
      row
      |> Mapper.map_course()
      |> Cursos.create_curso
    end)
  end

  defp create_cpc(path) do
    read_path(path)
    |> Enum.map(fn(row) ->
      row
      |> Mapper.map_cpc()
      |> Cpcs.create_cpc
    end)
  end
end
