defmodule Raem.Cpcs.Cpc do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Cpcs.Cpc


  schema "cpcs" do
    field :mun_curso, :string
    field :cod_ies, :integer
    field :nota_bruta_fg, :float
    field :regiao_curso, :string
    field :concluintes_inscritos, :integer
    field :nota_bruta_geral, :float
    field :nota_padronizada_iif, :float
    field :nota_bruta_doutores, :float
    field :cat_administrativa, :string
    field :nome_ies, :string
    field :org_academica, :string
    field :cod_area, :integer
    field :nota_continua_enade, :float
    field :nota_padronizada_odp, :float
    field :nota_padronizada_oaf, :float
    field :ano, :date
    field :num_cursos_unidade, :integer
    field :area_enquadramento, :string
    field :num_matriculas, :integer
    field :nota_padronizada_mestres, :float
    field :nota_bruta_mestres, :float
    field :nota_bruta_oaf, :float
    field :observacao, :string
    field :sigla_ies, :string
    field :nota_padronizada_regime_trabalho, :float
    field :cpc_faixa, :integer
    field :cod_municipio, :integer
    field :nota_padronizada_doutores, :float
    field :concluintes_participantes, :integer
    field :uf_curso, :string
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
    |> cast(attrs, [:ano, :cod_area, :area_enquadramento, :cod_ies, :nome_ies, :sigla_ies, :cat_administrativa, :org_academica, :cod_municipio, :mun_curso, :uf_curso, :regiao_curso, :num_cursos_unidade, :concluintes_inscritos, :concluintes_participantes, :nota_bruta_fg, :nota_bruta_ce, :nota_bruta_geral, :nota_continua_enade, :nota_bruta_odp, :nota_padronizada_odp, :nota_padronizada_iif, :nota_bruta_oaf, :nota_padronizada_oaf, :concluintes_participantes_enem, :percentual_concluintes_enem, :nota_bruta_idd, :nota_padronizada_idd, :num_docentes, :num_matriculas, :nota_bruta_mestres, :nota_padronizada_mestres, :nota_bruta_doutores, :nota_padronizada_doutores, :nota_bruta_regime_trabalho, :nota_padronizada_regime_trabalho, :cpc_continuo, :cpc_faixa, :observacao])
    |> validate_required([:ano, :cod_area, :area_enquadramento, :cod_ies, :nome_ies, :sigla_ies, :cat_administrativa, :org_academica, :cod_municipio, :mun_curso, :uf_curso, :regiao_curso, :num_cursos_unidade, :concluintes_inscritos, :concluintes_participantes, :nota_bruta_fg, :nota_bruta_ce, :nota_bruta_geral, :nota_continua_enade, :nota_bruta_odp, :nota_padronizada_odp, :nota_padronizada_iif, :nota_bruta_oaf, :nota_padronizada_oaf, :concluintes_participantes_enem, :percentual_concluintes_enem, :nota_bruta_idd, :nota_padronizada_idd, :num_docentes, :num_matriculas, :nota_bruta_mestres, :nota_padronizada_mestres, :nota_bruta_doutores, :nota_padronizada_doutores, :nota_bruta_regime_trabalho, :nota_padronizada_regime_trabalho, :cpc_continuo, :cpc_faixa, :observacao])
  end
end
