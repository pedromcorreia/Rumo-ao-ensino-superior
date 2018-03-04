defmodule RaemWeb.EnadeController do
  use RaemWeb, :controller

  alias Raem.Enades
  alias Raem.Enades.Enade

  def index(conn, _params) do
    enades = Enades.list_enades()
    render(conn, "index.html", enades: enades)
  end

  def new(conn, _params) do
    changeset = Enades.change_enade(%Enade{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"enade" => enade_params}) do
    case Enades.create_enade(enade_params) do
      {:ok, enade} ->
        conn
        |> put_flash(:info, "Enade created successfully.")
        |> redirect(to: enade_path(conn, :show, enade))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    enade = Enades.get_enade!(id)
    render(conn, "show.html", enade: enade)
  end

  def edit(conn, %{"id" => id}) do
    enade = Enades.get_enade!(id)
    changeset = Enades.change_enade(enade)
    render(conn, "edit.html", enade: enade, changeset: changeset)
  end

  def update(conn, %{"id" => id, "enade" => enade_params}) do
    enade = Enades.get_enade!(id)

    case Enades.update_enade(enade, enade_params) do
      {:ok, enade} ->
        conn
        |> put_flash(:info, "Enade updated successfully.")
        |> redirect(to: enade_path(conn, :show, enade))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", enade: enade, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    enade = Enades.get_enade!(id)
    {:ok, _enade} = Enades.delete_enade(enade)

    conn
    |> put_flash(:info, "Enade deleted successfully.")
    |> redirect(to: enade_path(conn, :index))
  end
end
