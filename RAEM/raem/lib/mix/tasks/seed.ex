defmodule Mix.Tasks.Seed do
  @shortdoc """

  Mix for seed the dataset
  Receives a path of resources

  """
  use Mix.Task
  import Mix.Ecto
  alias Raem.Parser
  alias Raem.{Idds, Igcs, Enades, Cpcs}

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

    path = default_dir_name <> "IDD/*.{csv}"
    path
    |> Path.wildcard()
    |> Parser.parse(:stream)
    |> Enum.map(fn(row) ->
      row
      |> map_idd()
      |> IO.inspect
      #|> Idds.create_idd
    end)
  end

  defp map_idd(map) do
    instituicao = %{
      cod_ies: Parser.read_field(map, "cod_ies", :integer),
      nome_ies: Parser.read_field(map, "nome_ies"),
      sigla_ies: Parser.read_field(map, "sigla_ies"),
      org_academica: Parser.read_field(map, "org_academica"),
      cat_administrativa: Parser.read_field(map, "cat_administrativa"),
      cod_municipio: Parser.read_field(map, "cod_municipio", :integer),
      sigla_uf: Parser.read_field(map, "sigla_uf")
      municipio_curso: Parser.read_field(map, "municipio_curso")
    }

   curso = %{
      cod_curso: Parser.read_field(map, "cod_curso", :integer),
      cod_area: Parser.read_field(map, "cod_area", :integer),
      area_enquadramento: Parser.read_field(map, "area_enquadramento"),
      modalidade_ensino: Parser.read_field(map, "modalidade_ensino"),
      concluintes_inscritos: Parser.read_field(map, "concluintes_inscritos", :integer),
      concluintes_participantes: Parser.read_field(map, "concluintes_participantes", :integer),
      concluintes_participantes_enem: Parser.read_field(map, "concluintes_participantes_enem", :integer),
      percentual_concluintes_participantes_enem: Parser.read_field(map, "percentual_concluintes_participantes_enem", :float),
      nota_bruta_idd: Parser.read_field(map, "nota_bruta_idd", :float),
      nota_padronizada_idd: Parser.read_field(map, "nota_padronizada_idd"),
      idd_faixa: Parser.read_field(map, "idd_faixa"),
    }
  end
end
