defmodule Raem.Cpcs.Cpc do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Cpcs.Cpc


  schema "cpcs" do
    field :nota_bruta_fg, :float
    field :concluintes_inscritos, :integer
    field :nota_padronizada_iif, :float
    field :nota_bruta_doutores, :float
    field :nota_continua_enade, :float
    field :nota_padronizada_odp, :float
    field :nota_padronizada_oaf, :float
    field :ano, :string
    field :nota_padronizada_mestres, :float
    field :nota_bruta_mestres, :float
    field :nota_bruta_oaf, :float
    field :nota_padronizada_regime_trabalho, :float
    field :cpc_faixa, :integer
    field :nota_padronizada_doutores, :float
    field :concluintes_participantes, :integer
    field :num_docentes, :integer
    field :concluintes_participantes_enem, :integer
    field :cpc_continuo, :float
    field :percentual_concluintes_enem, :float
    field :nota_bruta_regime_trabalho, :float
    field :nota_bruta_odp, :float
    field :nota_bruta_idd, :float
    field :nota_bruta_ce, :float
    field :nota_padronizada_idd, :float

    timestamps()
  end

  @doc false
  def changeset(%Cpc{} = cpc, attrs) do
    cpc
    |> cast(attrs, [:ano, :concluintes_inscritos, :concluintes_participantes, :nota_bruta_fg, :nota_bruta_ce, :nota_continua_enade, :nota_bruta_odp, :nota_padronizada_odp, :nota_padronizada_iif, :nota_bruta_oaf, :nota_padronizada_oaf, :concluintes_participantes_enem, :percentual_concluintes_enem, :nota_bruta_idd, :nota_padronizada_idd, :num_docentes, :nota_bruta_mestres, :nota_padronizada_mestres, :nota_bruta_doutores, :nota_padronizada_doutores, :nota_bruta_regime_trabalho, :nota_padronizada_regime_trabalho, :cpc_continuo, :cpc_faixa])
    |> validate_required([:ano, :concluintes_inscritos, :concluintes_participantes, :nota_bruta_fg, :nota_bruta_ce, :nota_continua_enade, :nota_bruta_odp, :nota_padronizada_odp, :nota_padronizada_iif, :nota_bruta_oaf, :nota_padronizada_oaf, :concluintes_participantes_enem, :percentual_concluintes_enem, :nota_bruta_idd, :nota_padronizada_idd, :num_docentes, :nota_bruta_mestres, :nota_padronizada_mestres, :nota_bruta_doutores, :nota_padronizada_doutores, :nota_bruta_regime_trabalho, :nota_padronizada_regime_trabalho, :cpc_continuo, :cpc_faixa])
  end
end
