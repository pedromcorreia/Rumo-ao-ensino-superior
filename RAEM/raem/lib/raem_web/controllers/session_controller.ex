defmodule RaemWeb.SessionController do
  use RaemWeb, :controller

  alias Raem.User
  alias Raem.Users.Session

  def new(conn, _params) do
    changeset = User.change_session(%Session{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"session" => session_params}) do
    case conn
    |> User.create_session(session_params) do
      {:ok, user} ->
        conn
        |> login_user(user)
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, _) do
    conn
    |> clear_session()
    |> redirect(to: session_path(conn, :new))
  end
end
