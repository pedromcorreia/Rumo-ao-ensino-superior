defmodule Raem.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Users.User


  schema "users" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
