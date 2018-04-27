defmodule Raem.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Raem.Repo

  alias Raem.Users.User

  @doc """
  Returns the list of users.

  ## Examples

  iex> list_users()
  [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

  iex> get_user!(123)
  %User{}

  iex> get_user!(456)
  ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

  iex> create_user(%{field: value})
  {:ok, %User{}}

  iex> create_user(%{field: bad_value})
  {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

  iex> update_user(user, %{field: new_value})
  {:ok, %User{}}

  iex> update_user(user, %{field: bad_value})
  {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

  iex> delete_user(user)
  {:ok, %User{}}

  iex> delete_user(user)
  {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

  iex> change_user(user)
  %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Comeonin.Bcrypt
  alias Ecto.Changeset
  alias Raem.Users.Session

  @doc """
  Authenticates an user.
  ## Examples
  #      iex> create_session(org_or_context, email, password)
  #            {:ok, %User{}}
  #                  iex> create_session(org_or_context, email, password)
  #                        {:error, %Ecto.Changeset{}}
  """

  def create_session(attrs) do
    case %{Session.changeset(%Session{}, attrs) | action: :insert} do
      %Changeset{valid?: true, changes: %{email: email, password: pass}} = cs ->
        user = get_user_by_email(email)

        cond do
          user && Bcrypt.checkpw(pass, user.password_hash) ->
            {:ok, user}

          user ->
            {:error, Changeset.add_error(cs, :password, "is invalid")}
          true ->
            Bcrypt.dummy_checkpw()
            {:error, Changeset.add_error(cs, :email, "not found")}
        end

      cs ->
        {:error, cs}
    end
  end

  def change_session(%Session{} = session), do: Session.changeset(session, %{})

  def get_user_by_email(email), do: Repo.get_by(User, [email: email])
end
