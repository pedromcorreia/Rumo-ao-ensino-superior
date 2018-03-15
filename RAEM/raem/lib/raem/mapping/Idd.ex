defmodule Raem.Mappings.Idd do

  def build(%Contract{} = contract) do
    raw_type = read_field(contract.metadata, :type)
    {:ok, lat: lat, lng: lng} = get_geolocation(contract)
    %{
      ano: nil,
      area_enquadramento: nil,
      cat_administrativa: nil,
      cod_area: nil,
      cod_curso: nil,
      cod_ies: nil,
      cod_municipio: nil,
      concluintes_inscritos: nil,
      concluintes_participantes: nil,
      concluintes_participantes_enem: nil,
      id: nil,
      idd_faixa: nil,
      inserted_at: nil,
      modalidade_ensino: nil,
      municipio_curso: nil,
      nome_ies: nil,
      nota_bruta_idd: nil,
      nota_padronizada_idd: nil,
      org_academica: nil,
      percentual_concluintes_participantes_enem: nil,
      sigla_ies: nil,
      sigla_uf: nil,
      updated_at: nil
    }
 end

  defp get_geolocation(contract) do
    contract
    |> Map.get(:metadata, %{})
    |> full_address()
    |> Geocoder.get_location_by_address()
    |> case do
      {:ok, result} ->
        %{"lat" => lat, "lng" => lng} =
          result
          |> Map.get("geometry", %{})
          |> Map.get("location", %{"lat" => nil, "lng" => nil})

          {:ok, lat: lat, lng: lng}

      {:error, "ZERO_RESULTS"} ->
        {:ok, %{no_response: true}}

      {:error, "OVER_QUERY_LIMIT", _message} ->
        {:ok, %{no_response: true}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp full_address(metadata \\ %{}) do
    federative_unit = read_field(metadata, :federative_unit)
    street = read_field(metadata, :street)
    district = read_field(metadata, :district)
    city = read_field(metadata, :city)
    zip_code = read_field(metadata, :zip_code)

    "#{street} - #{district}, #{city} - #{federative_unit}, #{zip_code}"
  end
end
