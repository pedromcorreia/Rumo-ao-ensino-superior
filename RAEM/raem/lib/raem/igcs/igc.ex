defmodule Raem.Igcs.Igc do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Igcs.Igc


  schema "igcs" do
    field :alfa_proporcao_graduandos, :float
    field :ano, :date
    field :beta_proporcao_mestrandos, :float
    field :cat_administrativa, :string
    field :cod_ies, :integer
    field :conceito_doutorado, :float
    field :conceito_graduacao, :float
    field :conceito_mestrado, :float
    field :gama_proporcao_doutorando, :float
    field :igc_continuo, :float
    field :igc_faixa, :integer
    field :nome_ies, :string
    field :num_cursos_avaliados, :integer
    field :num_cursos_cpc, :integer
    field :observacao, :string
    field :org_academica, :string
    field :sigla_ies, :string
    field :uf_ies, :string

    timestamps()
  end

  @doc false
  def changeset(%Igc{} = igc, attrs) do
    igc
    |> cast(attrs, [:cod_ies, :ano, :nome_ies, :sigla_ies, :cat_administrativa, :org_academica, :uf_ies, :num_cursos_avaliados, :num_cursos_cpc, :alfa_proporcao_graduandos, :conceito_graduacao, :beta_proporcao_mestrandos, :conceito_mestrado, :gama_proporcao_doutorando, :conceito_doutorado, :igc_continuo, :igc_faixa, :observacao])
    |> validate_required([:cod_ies, :ano, :nome_ies, :sigla_ies, :cat_administrativa, :org_academica, :uf_ies, :num_cursos_avaliados, :num_cursos_cpc, :alfa_proporcao_graduandos, :conceito_graduacao, :beta_proporcao_mestrandos, :conceito_mestrado, :gama_proporcao_doutorando, :conceito_doutorado, :igc_continuo, :igc_faixa, :observacao])
  end
end
