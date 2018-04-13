defmodule Raem.Cursos do
  @moduledoc """
  The Cursos context.
  """

  import Ecto.Query, warn: false
  alias Raem.Repo

  alias Raem.Cursos.Curso
  alias Raem.Instituicoes.Instituicao
  alias Raem.Igcs.Igc
  alias Raem.Cpcs.Cpc

  @doc """
  Returns the list of cursos.

  ## Examples

  iex> list_cursos()
  [%Curso{}, ...]

  """
  def list_cursos do
    Repo.all(Curso)
  end

  @doc """
  Gets a single curso.

  Raises `Ecto.NoResultsError` if the Curso does not exist.

  ## Examples

  iex> get_curso!(123)
  %Curso{}

  iex> get_curso!(456)
  ** (Ecto.NoResultsError)

  """
  def get_curso!(id), do: Repo.get!(Curso, id)

  @doc """
  Creates a curso.

  ## Examples

  iex> create_curso(%{field: value})
  {:ok, %Curso{}}

  iex> create_curso(%{field: bad_value})
  {:error, %Ecto.Changeset{}}

  """
  def create_curso(attrs \\ %{}) do
    %Curso{}
    |> Curso.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a curso.

  ## Examples

  iex> update_curso(curso, %{field: new_value})
  {:ok, %Curso{}}

  iex> update_curso(curso, %{field: bad_value})
  {:error, %Ecto.Changeset{}}

  """
  def update_curso(%Curso{} = curso, attrs) do
    curso
    |> Curso.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Curso.

  ## Examples

  iex> delete_curso(curso)
  {:ok, %Curso{}}

  iex> delete_curso(curso)
  {:error, %Ecto.Changeset{}}

  """
  def delete_curso(%Curso{} = curso) do
    Repo.delete(curso)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking curso changes.

  ## Examples

  iex> change_curso(curso)
  %Ecto.Changeset{source: %Curso{}}

  """
  def change_curso(%Curso{} = curso) do
    Curso.changeset(curso, %{})
  end

  def list_all_by(id, :area_enquadramento) do
    from(c in Curso,
         join: i in Instituicao,
         where: c.cod_ies == i.cod_ies and
         like(c.area_enquadramento, ^("%" <> id <> "%")),
         select: %{
           area_enquadramento: c.area_enquadramento,
           modalidade_ensino: c.modalidade_ensino,
           municipio_curso: c.municipio_curso,
           sigla_uf: c.sigla_uf,
           id: c.id,
           nome_ies: i.nome_ies,
           sigla_ies: i.sigla_ies}
    )
    |> Repo.all()
  end

  defp get_cpc() do

    cpc_result =
      from(c in Curso,
           join: cpc in Cpc,
           where: c.cod_ies == cpc.cod_ies and c.id == ^id,
           select: %{
             nota_bruta_fg: cpc.nota_bruta_fg,
             concluintes_inscritos: cpc.concluintes_inscritos,
             nota_padronizada_iif: cpc.nota_padronizada_iif,
             nota_bruta_doutores: cpc.nota_bruta_doutores,
             nota_continua_enade: cpc.nota_continua_enade,
             nota_padronizada_odp: cpc.nota_padronizada_odp,
             nota_padronizada_oaf: cpc.nota_padronizada_oaf,
             ano: cpc.ano,
             nota_padronizada_mestres: cpc.nota_padronizada_mestres,
             nota_bruta_mestres: cpc.nota_bruta_mestres,
             nota_bruta_oaf: cpc.nota_bruta_oaf,
             nota_padronizada_regime_trabalho: cpc.nota_padronizada_regime_trabalho,
             cpc_faixa: cpc.cpc_faixa,
             nota_padronizada_doutores: cpc.nota_padronizada_doutores,
             concluintes_participantes: cpc.concluintes_participantes,
             num_docentes: cpc.num_docentes,
             concluintes_participantes_enem: cpc.concluintes_participantes_enem,
             cpc_continuo: cpc.cpc_continuo,
             percentual_concluintes_enem: cpc.percentual_concluintes_enem,
             nota_bruta_regime_trabalho: cpc.nota_bruta_regime_trabalho,
             nota_bruta_odp: cpc.nota_bruta_odp,
             nota_bruta_idd: cpc.nota_bruta_idd,
             nota_bruta_ce: cpc.nota_bruta_ce,
             nota_padronizada_idd: cpc.nota_padronizada_idd
           }
      )
      |> Repo.all()
      |> List.first()
  end

  def get_curso_by_id(id) do
    instituicao =
      from(c in Curso,
           join: i in Instituicao,
           where: c.cod_ies == i.cod_ies and c.id == ^id,
           select: %{
             area_enquadramento: c.area_enquadramento,
             modalidade_ensino: c.modalidade_ensino,
             municipio_curso: c.municipio_curso,
             sigla_uf: c.sigla_uf,
             id: c.id,
             nome_ies: i.nome_ies,
             sigla_ies: i.sigla_ies,
             cod_ies: i.cod_ies}
      )
      |> Repo.all()
      |> List.first()
      |> IO.inspect

    igc_result =
      from(i in Instituicao,
           join: g in Igc,
           where: i.cod_ies == g.cod_ies and i.id == ^instituicao.cod_ies,
           select: %{
             alfa_proporcao_graduandos: g.alfa_proporcao_graduandos,
             ano: g.ano,
             beta_proporcao_mestrandos: g.beta_proporcao_mestrandos,
             cod_ies: g.cod_ies,
             conceito_doutorado: g.conceito_doutorado,
             conceito_graduacao: g.conceito_graduacao,
             conceito_mestrado: g.conceito_mestrado,
             gama_proporcao_doutorando: g.gama_proporcao_doutorando,
             igc_continuo: g.igc_continuo,
             igc_faixa: g.igc_faixa,
             num_cursos_cpc: g.num_cursos_cpc
           }
      )
      |> Repo.all()
      |> List.first()
      |> IO.inspect

    Map.merge(instituicao, igc_result)
  end
end
