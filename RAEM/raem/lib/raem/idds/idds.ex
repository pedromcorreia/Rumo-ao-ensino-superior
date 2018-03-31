defmodule Raem.Idds do
  @moduledoc """
  The Idds context.
  """

  import Ecto.Query
  alias Raem.Repo

  alias Raem.Idds.Idd

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

  @doc """
  Returns an list for idd by area_enquadramento.

  ## Examples

  iex> change_idd(%Idd{area_enquadramento: area_enquadramento} = idd)
  [%Idd{}, ...]

  """
  def get_by!(params) do
    [area_enquadramento: area_enquadramento_param] = params
    area_enquadramento_param = String.upcase(area_enquadramento_param)
    from(i in Idd, where: i.area_enquadramento == ^area_enquadramento_param, select: %{ano: i.ano, area_enquadramento: i.area_enquadramento, nome: i.nome_ies})
    |> Repo.all()
    end
end

