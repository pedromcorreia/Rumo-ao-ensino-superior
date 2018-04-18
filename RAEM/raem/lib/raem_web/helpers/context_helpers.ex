defmodule RaemWeb.ContextHelpers do
  @moduledoc """
  This module have some helper functions to Plug.Conn or Phoenix.Socket on
  bcredi.
  """

  alias Raem.Auth
  alias Raem.Auth.User
  alias Phoenix.Socket
  alias Plug.Conn

  def current_user(conn_or_socket), do: conn_or_socket.assigns[:current_user]

  def to_context(conn_or_socket) do
    to_context(
      current_user(conn_or_socket)
    )
  end

  def to_context(user) when user == nil,
    do: raise(ArgumentError, "There is not enough data to load Context")

  def login_user(%Conn{} = conn, %User{} = user) do
    conn
    |> Conn.put_session(:current_user_id, user.id)
    |> Conn.assign(:current_user, user)
  end

  def login_user(socket, user_id) when is_integer(user_id) do
    login_user(socket, Auth.get_user!(user_id))
  end

  def login_user(%Socket{} = socket, %User{} = user) do
    socket
    |> Socket.assign(:current_user, user)
  end
end
