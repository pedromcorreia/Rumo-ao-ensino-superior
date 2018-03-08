defmodule Raem.Mapper do
  @moduledoc """
  This module has the functions to map the csv fields to database
  """
  alias Raem.FieldMapped

  def read_mapped_list(data) do
    data
    |> FieldMapped.read_list_field()
    |> List.flatten
  end
end
