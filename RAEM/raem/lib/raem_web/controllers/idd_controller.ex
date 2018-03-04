defmodule RaemWeb.IddController do
  use RaemWeb, :controller

  alias Raem.Idds
  alias Raem.Idds.Idd

  def index(conn, _params) do
    idds = Idds.list_idds()
    render(conn, "index.html", idds: idds)
  end

  def new(conn, _params) do
    changeset = Idds.change_idd(%Idd{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"idd" => idd_params}) do
    case Idds.create_idd(idd_params) do
      {:ok, idd} ->
        conn
        |> put_flash(:info, "Idd created successfully.")
        |> redirect(to: idd_path(conn, :show, idd))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    idd = Idds.get_idd!(id)
    render(conn, "show.html", idd: idd)
  end

  def edit(conn, %{"id" => id}) do
    idd = Idds.get_idd!(id)
    changeset = Idds.change_idd(idd)
    render(conn, "edit.html", idd: idd, changeset: changeset)
  end

  def update(conn, %{"id" => id, "idd" => idd_params}) do
    idd = Idds.get_idd!(id)

    case Idds.update_idd(idd, idd_params) do
      {:ok, idd} ->
        conn
        |> put_flash(:info, "Idd updated successfully.")
        |> redirect(to: idd_path(conn, :show, idd))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", idd: idd, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    idd = Idds.get_idd!(id)
    {:ok, _idd} = Idds.delete_idd(idd)

    conn
    |> put_flash(:info, "Idd deleted successfully.")
    |> redirect(to: idd_path(conn, :index))
  end
end
