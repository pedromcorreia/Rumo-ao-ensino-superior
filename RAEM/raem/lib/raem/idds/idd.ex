defmodule Raem.Idds.Idd do
  use Ecto.Schema
  import Ecto.Changeset
  alias Raem.Idds.Idd


  schema "idds" do
    field :ano, :date
    field :area_enquadramento, :string
    field :cat_administrativa, :string
    field :cod_area, :integer
    field :cod_curso, :integer
    field :cod_ies, :integer
    field :cod_municipio, :integer
    field :concluintes_inscritos, :integer
    field :concluintes_participantes, :integer
    field :concluintes_participantes_enem, :integer
    field :idd_faixa, :integer
    field :modalidade_ensino, :string
    field :municipio_curso, :string
    field :nome_ies, :string
    field :nota_bruta_idd, :float
    field :nota_padronizada_idd, :float
    field :org_academica, :string
    field :percentual_concluintes_participantes_enem, :float
    field :sigla_ies, :string
    field :sigla_uf, :string

    timestamps()
  end

  @doc false
  def changeset(%Idd{} = idd, attrs) do
    idd
    |> cast(attrs, [:ano, :cod_ies, :nome_ies, :sigla_ies, :org_academica, :cat_administrativa, :cod_curso, :cod_area, :area_enquadramento, :modalidade_ensino, :cod_municipio, :municipio_curso, :sigla_uf, :concluintes_inscritos, :concluintes_participantes, :concluintes_participantes_enem, :percentual_concluintes_participantes_enem, :nota_bruta_idd, :nota_padronizada_idd, :idd_faixa])
    |> validate_required([:ano, :cod_ies, :nome_ies, :sigla_ies, :org_academica, :cat_administrativa, :cod_curso, :cod_area, :area_enquadramento, :modalidade_ensino, :cod_municipio, :municipio_curso, :sigla_uf, :concluintes_inscritos, :concluintes_participantes, :concluintes_participantes_enem, :percentual_concluintes_participantes_enem, :nota_bruta_idd, :nota_padronizada_idd, :idd_faixa])
  end
end
