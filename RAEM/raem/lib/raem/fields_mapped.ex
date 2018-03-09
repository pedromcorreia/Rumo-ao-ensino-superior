defmodule Raem.FieldMapped do
  @moduledoc """
  This module has the functions to map the csv fields to database
  """

  @mappings %{
    ano: %{
      field: "Ano",
      type: :integer,
      value: "",
    },
    cod_ies: %{
      field: "Código da IES",
      type: :integer,
      value: "",
    },
    nome_ies: %{
      field: "Nome da IES",
      type: :string,
      value: "",
    },
    sigla_ies: %{
      field: "Sigla da IES",
      type: :string,
      value: "",
    },
    org_academica: %{
      field: "Organização Acadêmica",
      type: :string,
      value: "",
    },
    cat_administrativa: %{
      field: "Categoria Administrativa",
      type: :string,
      value: "",
    },
    cod_curso: %{
      field: "Código do Curso",
      type: :integer,
      value: "",
    },
    cod_area: %{
      field: "Código da Área",
      type: :integer,
      value: "",
    },
    area_enquadrament: %{
      field: "Área de Enquadramento",
      type: :string,
      value: "",
    },
    modalidade_ensino: %{
      field: "Modalidade de Ensino",
      type: :string,
      value: "",
    },
    cod_municipio: %{
      field: "Código do Município",
      type: :integer,
      value: "",
    },
    municipio_curso: %{
      field: "Município do Curso",
      type: :string,
      value: "",
    },
    sigla_uf: %{
      field: "Sigla da UF",
      type: :string,
      value: "",
    },
    concluintes_inscritos: %{
      field: "Concluintes Inscritos",
      type: :integer,
      value: "",
    },
    concluintes_participantes: %{
      field: "Concluintes Participantes",
      type: :integer,
      value: "",
    },
    concluintes_participantes_enem: %{
      field: "Concluintes Participantes com nota no Enem",
      type: :integer,
      value: "",
    },
    percentual_concluintes_participantes_enem: %{
      field: "Percentual de Concluintes participantes com nota no Enem",
      type: :float,
      value: "",
    },
    nota_bruta_idd: %{
      field: "Nota Bruta - IDD",
      type: :float,
      value: "",
    },
    nota_padronizada_idd: %{
      field: "Nota Padronizada - IDD",
      type: :float,
      value: "",
    },
    idd_faixa: %{
      field: "IDD (Faixa)",
      type: :string,
      value: "",
    }
  }

  def read_list_field(data) do
    data
    |> read_field()
    #|> create_struct()
  end

  def read_field(data) do
    data
    |> Enum.map(fn(map_data) ->
      field_mapped_list =
        @mappings
        |> Enum.map(fn(mapped) ->
          if(elem(mapped, 1).field == elem(map_data,0)) do
            Map.put(%{},elem(mapped, 0), elem(map_data,1))
          end
        end)
        |> Enum.filter(& !is_nil(&1))
    end)
    |> List.flatten
  end

  defp create_struct(list_mapped) do
    %{
        id: get_field(list, list_mapped),
        ano: get_field(list),
        area_enquadramento: get_field(list),
        cat_administrativa: get_field(list),
        cod_area: get_field(list),
        cod_curso: get_field(list),
        cod_ies: get_field(list),
        cod_municipio: get_field(list),
        concluintes_inscritos: get_field(list),
        concluintes_participantes: get_field(list),
        concluintes_participantes_enem: get_field(list),
        idd_faixa: get_field(list),
        modalidade_ensino: get_field(list),
        municipio_curso: get_field(list),
        nome_ies: get_field(list),
        nota_bruta_idd: get_field(list),
        nota_padronizada_idd: get_field(list),
        org_academica: get_field(list),
        percentual_concluintes_participantes_enem: get_field(list),
        sigla_ies: get_field(list),
        sigla_uf: get_field(list),
        inserted_at: get_field(list),
        updated_at: get_field(list)
    }
    list_mapped
    |> Enum.map(fn(mapped) ->
      IO.inspect(mapped)
    end)
  end
end
