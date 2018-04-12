defmodule Raem.Cursos do
  @moduledoc """
  The Cursos context.
  """

  import Ecto.Query, warn: false
  alias Raem.Repo

  alias Raem.Cursos.Curso
  alias Raem.Instituicoes.Instituicao

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

  def list_all_by(id) do
    from(c in Curso,
         join: i in Instituicao,
         where: c.cod_ies == i.cod_ies,
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

  def get_curso_by_id(id) do
    from(c in Curso,
         join: i in Instituicao,
         where: c.cod_ies == i.cod_ies
    )
    |> Repo.get!(id)
  end
end
