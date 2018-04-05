defmodule Raem.Instituicoes do
  @moduledoc """
  The Instituicoes context.
  """

  import Ecto.Query, warn: false
  alias Raem.Repo

  alias Raem.Instituicoes.Instituicao

  @doc """
  Returns the list of instituicoes.

  ## Examples

      iex> list_instituicoes()
      [%Instituicao{}, ...]

  """
  def list_instituicoes do
    Repo.all(Instituicao)
  end

  @doc """
  Gets a single instituicao.

  Raises `Ecto.NoResultsError` if the Instituicao does not exist.

  ## Examples

      iex> get_instituicao!(123)
      %Instituicao{}

      iex> get_instituicao!(456)
      ** (Ecto.NoResultsError)

  """
  def get_instituicao!(id), do: Repo.get!(Instituicao, id)

  @doc """
  Creates a instituicao.

  ## Examples

      iex> create_instituicao(%{field: value})
      {:ok, %Instituicao{}}

      iex> create_instituicao(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_instituicao(attrs \\ %{}) do
    %Instituicao{}
    |> Instituicao.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a instituicao.

  ## Examples

      iex> update_instituicao(instituicao, %{field: new_value})
      {:ok, %Instituicao{}}

      iex> update_instituicao(instituicao, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_instituicao(%Instituicao{} = instituicao, attrs) do
    instituicao
    |> Instituicao.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Instituicao.

  ## Examples

      iex> delete_instituicao(instituicao)
      {:ok, %Instituicao{}}

      iex> delete_instituicao(instituicao)
      {:error, %Ecto.Changeset{}}

  """
  def delete_instituicao(%Instituicao{} = instituicao) do
    Repo.delete(instituicao)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking instituicao changes.

  ## Examples

      iex> change_instituicao(instituicao)
      %Ecto.Changeset{source: %Instituicao{}}

  """
  def change_instituicao(%Instituicao{} = instituicao) do
    Instituicao.changeset(instituicao, %{})
  end
end
