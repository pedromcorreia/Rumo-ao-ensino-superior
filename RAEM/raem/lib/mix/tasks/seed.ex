defmodule Mix.Tasks.Seed do
  @shortdoc """

  Mix for seed the dataset
  Receives a path of resources

  """
  use Mix.Task
  import Mix.Ecto
  alias Raem.Parser
  alias Raem.{Idds, Igcs, Enades, Cpcs, Instituicoes}

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

    #path = default_dir_name <> "IDD/*.{csv}"
    path = default_dir_name <> "IGC/igc_2016.csv.0"
    file_read =
      path
      |> Path.wildcard()
      |> Parser.parse(:stream)

    file_read
    |> Enum.map(fn(row) ->
      row
      |> map_instituition()
    end)
    |> Enum.group_by(& &1.cod_ies)
    |> Enum.map(fn {_, instituitions} ->
      List.first(instituitions)
      |> Instituicoes.create_instituicao
    end)

    file_read
    |> Enum.map(fn(row) ->
      row
      |> map_igc()
      |> Igcs.create_igc
    end)
  end

  defp map_instituition(map) do
    %{
      cod_ies: Parser.read_field(map, "Cód.IES", :integer),
      nome_ies: Parser.read_field(map, "Nome da IES"),
      sigla_ies: Parser.read_field(map, "Sigla da IES"),
      org_academica: Parser.read_field(map, "Org. Acadêmica"),
      cat_administrativa: Parser.read_field(map, "Categ. Administrativa"),
    }
  end

  defp map_igc(map) do
    %{
      cod_ies: Parser.read_field(map, "Cód.IES", :integer),
      ano: Parser.read_field(map, "Ano"),
      num_cursos_cpc: Parser.read_field(map, "Nr. de Cursos com CPC no Triênio", :integer),
      alfa_proporcao_graduandos: Parser.read_field(map, "alfa (Proporção de Graduandos)", :float),
      conceito_graduacao: Parser.read_field(map, "Conceito médio da Graduação", :float),
      beta_proporcao_mestrandos: Parser.read_field(map, "beta (Proporção de Mestrandos - Equivalente)", :float),
      conceito_mestrado: Parser.read_field(map, "Conceito Médio do Mestrado", :float),
      gama_proporcao_doutorando: Parser.read_field(map, "gama (Proporção de Doutorandos - Equivalente)", :float),
      conceito_doutorado: Parser.read_field(map, "Conceito Médio do doutorado", :float),
      igc_continuo: Parser.read_field(map, "IGC (Contínuo)", :float),
      igc_faixa: Parser.read_field(map, "IGC (faixa)", :integer),
    }
  end
end
