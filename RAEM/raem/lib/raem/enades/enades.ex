defmodule Raem.Enades do
  @moduledoc """
  The Enades context.
  """

  import Ecto.Query, warn: false
  alias Raem.Repo

  alias Raem.Enades.Enade

  @doc """
  Returns the list of enades.

  ## Examples

      iex> list_enades()
      [%Enade{}, ...]

  """
  def list_enades do
    Repo.all(Enade)
  end

  @doc """
  Gets a single enade.

  Raises `Ecto.NoResultsError` if the Enade does not exist.

  ## Examples

      iex> get_enade!(123)
      %Enade{}

      iex> get_enade!(456)
      ** (Ecto.NoResultsError)

  """
  def get_enade!(id), do: Repo.get!(Enade, id)

  @doc """
  Creates a enade.

  ## Examples

      iex> create_enade(%{field: value})
      {:ok, %Enade{}}

      iex> create_enade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_enade(attrs \\ %{}) do
    %Enade{}
    |> Enade.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a enade.

  ## Examples

      iex> update_enade(enade, %{field: new_value})
      {:ok, %Enade{}}

      iex> update_enade(enade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_enade(%Enade{} = enade, attrs) do
    enade
    |> Enade.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Enade.

  ## Examples

      iex> delete_enade(enade)
      {:ok, %Enade{}}

      iex> delete_enade(enade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_enade(%Enade{} = enade) do
    Repo.delete(enade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking enade changes.

  ## Examples

      iex> change_enade(enade)
      %Ecto.Changeset{source: %Enade{}}

  """
  def change_enade(%Enade{} = enade) do
    Enade.changeset(enade, %{})
  end
end
