defmodule Raem.Parser do
  use Ecto.Schema

  NimbleCSV.define(MyParser, separator: ",", escape: "\"")

  def read_files(file_path) do
    file_path
    |> Enum.map(fn(file) ->
      file
      |> File.stream!
      |> MyParser.parse_stream
      |> Stream.map(&map_csv(&1))
      |> Enum.to_list
   end)
  end

  defp map_csv ([ano, cod_ies, nome_ies, sigla_ies, org_academica, cat_administrativa, cod_curso, cod_area, area_enquadramento, modalidade_ensino, cod_municipio, municipio_curso, sigla_uf, concluintes_inscritos, concluintes_participantes, concluintes_participantes_enem, percentual_concluintes_participantes_enem, nota_bruta_idd, nota_padronizada_idd, idd_faixa]
  ) do
    %{ano: ano, area_enquadramento: area_enquadramento, cat_administrativa: cat_administrativa, cod_area: cod_area, cod_curso: cod_curso, cod_ies: cod_ies, cod_municipio: cod_municipio, concluintes_inscritos: concluintes_inscritos, concluintes_participantes: concluintes_participantes, concluintes_participantes_enem: concluintes_participantes_enem, idd_faixa: idd_faixa, modalidade_ensino: modalidade_ensino, municipio_curso: municipio_curso, nome_ies: nome_ies, nota_bruta_idd: nota_bruta_idd, nota_padronizada_idd: nota_padronizada_idd, org_academica: org_academica, percentual_concluintes_participantes_enem: percentual_concluintes_participantes_enem, sigla_ies: sigla_ies, sigla_uf: sigla_uf}
  end
end
