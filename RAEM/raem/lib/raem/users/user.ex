defmodule Raem.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Users.User


  schema "users" do
    field :due, :naive_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:title, :due])
    |> validate_required([:title, :due])
  end
end
