defmodule Raem.Idds do
  @moduledoc """
  The Idds context.
  """

  import Ecto.Query
  alias Raem.Repo

  alias Raem.Idds.Idd
 
  @doc """
  Creates a idd.

  ## Examples

      iex> create_idd(%{field: value})
      {:ok, %Idd{}}

      iex> create_idd(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_idd(attrs \\ %{}) do
    %Idd{}
    |> Idd.changeset(attrs)
    |> Repo.insert()
  end


  @doc """
  Returns the list of idds.

  ## Examples

  iex> list_idds()
  [%Idd{}, ...]

  """
  def list_idds do
    Repo.all(Idd)
  end

  @doc """
  Gets a single idd.

  Raises `Ecto.NoResultsError` if the Idd does not exist.

  ## Examples

  iex> get_idd!(123)
  %Idd{}

  iex> get_idd!(456)
  ** (Ecto.NoResultsError)

  """
  def get_idd!(id), do: Repo.get!(Idd, id)

  def list_all_by(area_enquadramento, :area_enquadramento) do
    from(i in Idd,
         where: i.area_enquadramento == ^area_enquadramento,
         select: %{
           area_enquadramento: i.area_enquadramento,
           municipio_curso: i.municipio_curso,
           id: i.id,
           nota_padronizada_idd: i.nota_padronizada_idd,
           nome: i.nome_ies})
    |> Repo.all()
    end
end

