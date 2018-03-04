defmodule Raem.Enades.Enade do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Enades.Enade


  schema "enades" do
    field :ano, :date
    field :area, :string
    field :cod_grupo, :integer
    field :cod_ies, :integer
    field :cod_municipio, :integer
    field :conceito_enade, :integer
    field :conceito_idd, :integer
    field :media_ce_conc, :float
    field :media_ce_ing, :float
    field :media_fg_cong, :float
    field :media_fg_ing, :float
    field :media_geral_conc, :float
    field :media_geral_ing, :float
    field :municipio, :string
    field :nome_ies, :string
    field :sigla_ies, :string
    field :sub_area, :string
    field :uf, :string

    timestamps()
  end

  @doc false
  def changeset(%Enade{} = enade, attrs) do
    enade
    |> cast(attrs, [:cod_grupo, :cod_ies, :cod_municipio, :ano, :area, :sub_area, :nome_ies, :sigla_ies, :municipio, :uf, :media_fg_ing, :media_fg_cong, :media_ce_ing, :media_ce_conc, :media_geral_ing, :media_geral_conc, :conceito_enade, :conceito_idd])
    |> validate_required([:cod_grupo, :cod_ies, :cod_municipio, :ano, :area, :sub_area, :nome_ies, :sigla_ies, :municipio, :uf, :media_fg_ing, :media_fg_cong, :media_ce_ing, :media_ce_conc, :media_geral_ing, :media_geral_conc, :conceito_enade, :conceito_idd])
  end
end
