defmodule RaemWeb.LoginPlug do
  @moduledoc """
  This plug ensure the user is loaded on the assigns
  """

  import Plug.Conn
  alias Raem.User
  alias Raem.Users.User
  
  @doc false
  def init(_), do: nil

  @doc false
  def call(%Plug.Conn{assigns: %{current_user: user}} = conn, nil) when user != nil do
    conn
  end

  defp do_call(conn, user_id), do: do_call(conn, user_id)
  defp do_call(conn, user) when user == nil, do: conn
  defp do_call(%Plug.Conn{assigns: %{current_user: _}} = conn, _), do: conn
  defp do_call(conn, user_id) when is_integer(user_id), do: do_call(conn, Auth.get_user(user_id))
  defp do_call(conn, %User{} = user) do
    token = Phoenix.Token.sign("user_socket", user.id)
    conn
    |> assigns(:current_user, user)
    |> assigns(:current_user_toker, token)
  end
end
