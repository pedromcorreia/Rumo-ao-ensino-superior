defmodule Raem.Instituicoes.Instituicao do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Instituicoes.Instituicao


  schema "instituicoes" do
    field :cat_administratica, :string
    field :cod_ies, :integer
    field :nome_ies, :string
    field :org_academica, :string
    field :sigla_ies, :string

    timestamps()
  end

  @doc false
  def changeset(%Instituicao{} = instituicao, attrs) do
    instituicao
    |> cast(attrs, [:cod_ies, :nome_ies, :sigla_ies, :org_academica, :cat_administratica])
    |> validate_required([:cod_ies, :nome_ies, :sigla_ies, :org_academica, :cat_administratica])
  end
end
