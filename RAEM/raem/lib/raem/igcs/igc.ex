defmodule Raem.Igcs.Igc do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Igcs.Igc


  schema "igcs" do
    field :alfa_proporcao_graduandos, :float
    field :ano, :string
    field :beta_proporcao_mestrandos, :float
    field :cod_ies, :integer
    field :conceito_doutorado, :float
    field :conceito_graduacao, :float
    field :conceito_mestrado, :float
    field :gama_proporcao_doutorando, :float
    field :igc_continuo, :float
    field :igc_faixa, :integer
    field :num_cursos_cpc, :integer

    timestamps()
  end

  @doc false
  def changeset(%Igc{} = igc, attrs) do
    igc
    |> cast(attrs, [:cod_ies, :ano, :num_cursos_cpc, :alfa_proporcao_graduandos, :conceito_graduacao, :beta_proporcao_mestrandos, :conceito_mestrado, :gama_proporcao_doutorando, :conceito_doutorado, :igc_continuo, :igc_faixa])
    |> validate_required([:cod_ies, :ano, :num_cursos_cpc, :alfa_proporcao_graduandos, :conceito_graduacao, :beta_proporcao_mestrandos, :conceito_mestrado, :gama_proporcao_doutorando, :conceito_doutorado, :igc_continuo, :igc_faixa])
  end
end
