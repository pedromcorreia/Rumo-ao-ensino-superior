defmodule Raem.FieldMapped do
  @moduledoc """
  This module has the functions to map the csv fields to database
  """

  @mappings %{
    ano: %{
      field: "Ano",
      type: :integer
    },
    cod_ies: %{
      field: "Código da IES",
      type: :integer
    },
    nome_ies: %{
      field: "Nome da IES",
      type: :string
    },
    sigla_ies: %{
      field: "Sigla da IES",
      type: :string
    },
    org_academica: %{
      field: "Organização Acadêmica",
      type: :string
    },
    cat_administrativa: %{
      field: "Categoria Administrativa",
      type: :string
    },
    cod_curso: %{
      field: "Código do Curso",
      type: :integer
    },
    cod_area: %{
      field: "Código da Área",
      type: :integer
    },
    area_enquadrament: %{
      field: "Área de Enquadramento",
      type: :string
    },
    modalidade_ensino: %{
      field: "Modalidade de Ensino",
      type: :string
    },
    cod_municipio: %{
      field: "Código do Município",
      type: :integer
    },
    municipio_curso: %{
      field: "Município do Curso",
      type: :string
    },
    sigla_uf: %{
      field: "Sigla da UF",
      type: :string
    },
    concluintes_inscritos: %{
      field: "Concluintes Inscritos",
      type: :integer
    },
    concluintes_participantes: %{
      field: "Concluintes Participantes",
      type: :integer
    },
    concluintes_participantes_enem: %{
      field: "Concluintes Participantes com nota no Enem",
      type: :integer
    },
    percentual_concluintes_participantes_enem: %{
      field: "Percentual de Concluintes participantes com nota no Enem",
      type: :float
    },
    nota_bruta_idd: %{
      field: "Nota Bruta - IDD",
      type: :float
    },
    nota_padronizada_idd: %{
      field: "Nota Padronizada - IDD",
      type: :float
    },
    idd_faixa: %{
      field: "IDD (Faixa)",
      type: :string
    }
  }

  def field_mapping(field) do
    @mappings[field]
  end

  def read_list_field(data) do
    data
    |> Enum.map(fn(map) ->
      map
      |> IO.inspect
      read_field(elem(map, 1), elem(map, 0))
    end)
  end

  def read_field(data, field, default \\ nil) do
    mapping = field_mapping(field)
    IO.inspect(field)
    IO.inspect(mapping)
    #    read_mapped_field(data, mapping.field, mapping.type, default)
  end

  defp read_mapped_field(data, key, type, default)
  when type in [:string, :raw] do
    Map.get(data, key, default)
  end
end
