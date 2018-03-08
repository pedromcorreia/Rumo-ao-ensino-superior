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

  def read_list_field(data) do
    read_field(data)
  end

  def read_field(data) do
    data
    |> Enum.map(fn(map_data) ->
      field_mapped_list =
        @mappings
        |> Enum.map(fn(mapped) ->
          if(elem(mapped, 1).field == elem(map_data,0)) do
            Map.put(%{}, elem(mapped, 0), elem(map_data,1))
          end
        end)
        |> Enum.filter(& !is_nil(&1))
    end)
  end
end
