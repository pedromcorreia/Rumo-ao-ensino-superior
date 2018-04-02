defmodule Raem.Instituicao do
  use Raem.Web, :model

  schema "instituicoes" do
    field :cod_ies, :integer
    field :nome_ies, :string
    field :sigla_ies, :string
    field :org_academica, :string
    field :cat_administratica, :string
    field :cod_municipio, :integer
    field :municipio_curso, :string
    field :sigla_uf, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:cod_ies, :nome_ies, :sigla_ies, :org_academica, :cat_administratica, :cod_municipio, :municipio_curso, :sigla_uf])
    |> validate_required([:cod_ies, :nome_ies, :sigla_ies, :org_academica, :cat_administratica, :cod_municipio, :municipio_curso, :sigla_uf])
  end
end
