defmodule Raem.FieldMappings.Setting do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.FieldMappings.Setting


  schema "settings" do
    field :field, :string
    field :from, :string
    field :to, :string

    timestamps()
  end

  @doc false
  def changeset(%Setting{} = setting, attrs) do
    setting
    |> cast(attrs, [:field, :from, :to])
    |> validate_required([:field, :from, :to])
  end
end
