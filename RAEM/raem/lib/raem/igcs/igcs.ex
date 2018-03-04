defmodule Raem.Igcs do
  @moduledoc """
  The Igcs context.
  """

  import Ecto.Query, warn: false
  alias Raem.Repo

  alias Raem.Igcs.Igc

  @doc """
  Returns the list of igcs.

  ## Examples

      iex> list_igcs()
      [%Igc{}, ...]

  """
  def list_igcs do
    Repo.all(Igc)
  end

  @doc """
  Gets a single igc.

  Raises `Ecto.NoResultsError` if the Igc does not exist.

  ## Examples

      iex> get_igc!(123)
      %Igc{}

      iex> get_igc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_igc!(id), do: Repo.get!(Igc, id)

  @doc """
  Creates a igc.

  ## Examples

      iex> create_igc(%{field: value})
      {:ok, %Igc{}}

      iex> create_igc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_igc(attrs \\ %{}) do
    %Igc{}
    |> Igc.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a igc.

  ## Examples

      iex> update_igc(igc, %{field: new_value})
      {:ok, %Igc{}}

      iex> update_igc(igc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_igc(%Igc{} = igc, attrs) do
    igc
    |> Igc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Igc.

  ## Examples

      iex> delete_igc(igc)
      {:ok, %Igc{}}

      iex> delete_igc(igc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_igc(%Igc{} = igc) do
    Repo.delete(igc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking igc changes.

  ## Examples

      iex> change_igc(igc)
      %Ecto.Changeset{source: %Igc{}}

  """
  def change_igc(%Igc{} = igc) do
    Igc.changeset(igc, %{})
  end
end
