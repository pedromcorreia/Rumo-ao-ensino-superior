defmodule RaemWeb.LoadUserPlug do

  import Plug.Conn
  import RaemWeb.ContextHelpers
  alias Raem.Auth
  alias Raem.Auth.User

  @doc false
  def init(_), do: nil

  @doc false
  def call(conn, nil), do: do_call(conn, get_session(conn, :current_user_id))

  defp do_call(conn, user_id), do: do_call(conn, user_id)

  defp do_call(conn, user) when user == nil do
    IO.puts "A"
    conn
  end

  defp do_call(%Plug.Conn{assigns: %{current_user: _}} = conn, _, _) do
    conn
  end

  defp do_call(conn, user_id) when is_integer(user_id) do
    do_call(conn, Auth.get_user(user_id))
  end

   defp do_call(conn, %User{} = user) do
     token = Phoenix.Token.sign(conn, "user_socket", user.id)
     conn
     |> assign(:current_user, user)
   end
end
