defmodule Raem.Idds do
  @moduledoc """
  The Idds context.
  """

  import Ecto.Query, warn: false
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
  Updates a idd.

  ## Examples

      iex> update_idd(idd, %{field: new_value})
      {:ok, %Idd{}}

      iex> update_idd(idd, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_idd(%Idd{} = idd, attrs) do
    idd
    |> Idd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Idd.

  ## Examples

      iex> delete_idd(idd)
      {:ok, %Idd{}}

      iex> delete_idd(idd)
      {:error, %Ecto.Changeset{}}

  """
  def delete_idd(%Idd{} = idd) do
    Repo.delete(idd)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking idd changes.

  ## Examples

      iex> change_idd(idd)
      %Ecto.Changeset{source: %Idd{}}

  """
  def change_idd(%Idd{} = idd) do
    Idd.changeset(idd, %{})
  end
end