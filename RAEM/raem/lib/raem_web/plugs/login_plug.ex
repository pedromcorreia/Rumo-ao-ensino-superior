defmodule RaemWeb.LoginPlug do
  @moduledoc """
  This plug ensure the user is loaded on the assigns
  """

  @doc false
  def init(_), do: nil

  @doc false
  def call(%Plug.Conn{assigns: %{current_user: user}} = conn, nil) when user != nil do
    conn
  end

  def call(conn, nil) do
    IO.inspect conn, label: "CONN"
    IO.puts "A"
   
  end
end
