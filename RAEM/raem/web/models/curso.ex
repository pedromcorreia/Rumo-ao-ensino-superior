defmodule Raem.Curso do
  use Raem.Web, :model

  schema "cursos" do
    field :cod_curso, :integer
    field :cod_area, :integer
    field :area_enquadramento, :string
    field :modalidade_ensino, :string
    field :concluintes_inscritos, :integer
    field :concluintes_participantes, :integer
    field :concluintes_participantes_enem, :integer
    field :percentual_concluintes_participantes_enem, :float
    field :nota_bruta_idd, :float
    field :nota_padronizada_idd, :float
    field :idd_faixa, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:cod_curso, :cod_area, :area_enquadramento, :modalidade_ensino, :concluintes_inscritos, :concluintes_participantes, :concluintes_participantes_enem, :percentual_concluintes_participantes_enem, :nota_bruta_idd, :nota_padronizada_idd, :idd_faixa])
    |> validate_required([:cod_curso, :cod_area, :area_enquadramento, :modalidade_ensino, :concluintes_inscritos, :concluintes_participantes, :concluintes_participantes_enem, :percentual_concluintes_participantes_enem, :nota_bruta_idd, :nota_padronizada_idd, :idd_faixa])
  end
end
