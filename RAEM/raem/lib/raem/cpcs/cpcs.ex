defmodule Raem.Cpcs do
  @moduledoc """
  The Cpcs context.
  """

  import Ecto.Query, warn: false
  alias Raem.Repo

  alias Raem.Cpcs.Cpc

  @doc """
  Returns the list of cpcs.

  ## Examples

      iex> list_cpcs()
      [%Cpc{}, ...]

  """
  def list_cpcs do
    Repo.all(Cpc)
  end

  @doc """
  Gets a single cpc.

  Raises `Ecto.NoResultsError` if the Cpc does not exist.

  ## Examples

      iex> get_cpc!(123)
      %Cpc{}

      iex> get_cpc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cpc!(id), do: Repo.get!(Cpc, id)

  @doc """
  Creates a cpc.

  ## Examples

      iex> create_cpc(%{field: value})
      {:ok, %Cpc{}}

      iex> create_cpc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cpc(attrs \\ %{}) do
    %Cpc{}
    |> Cpc.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cpc.

  ## Examples

      iex> update_cpc(cpc, %{field: new_value})
      {:ok, %Cpc{}}

      iex> update_cpc(cpc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cpc(%Cpc{} = cpc, attrs) do
    cpc
    |> Cpc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cpc.

  ## Examples

      iex> delete_cpc(cpc)
      {:ok, %Cpc{}}

      iex> delete_cpc(cpc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cpc(%Cpc{} = cpc) do
    Repo.delete(cpc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cpc changes.

  ## Examples

      iex> change_cpc(cpc)
      %Ecto.Changeset{source: %Cpc{}}

  """
  def change_cpc(%Cpc{} = cpc) do
    Cpc.changeset(cpc, %{})
  end
end
