defmodule Raem.Users.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field(:email, :string, virtual: true)
    field(:password, :string, virtual: true)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_email()
    |> validate_password()
    |> validate_format(:email, ~r/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/ui)
  end

  defp validate_email(changeset) do
    case get_field(changeset, :email) do
      nil ->
        add_error(changeset, :email, "Field can not be empty")

      "" ->
        add_error(changeset, :email, "Field can not be empty")

      _ ->
        changeset
    end
  end

  defp validate_password(changeset) do
    case get_field(changeset, :password) do
      nil ->
        add_error(changeset, :password, "Password is invalid")

      "" ->
        add_error(changeset, :password, "Password is invalid")

      _ ->
        changeset
    end
  end
end
