defmodule RaemWeb.IgcController do
  use RaemWeb, :controller

  alias Raem.Igcs
  alias Raem.Igcs.Igc

  def index(conn, _params) do
    igcs = Igcs.list_igcs()
    render(conn, "index.html", igcs: igcs)
  end

  def new(conn, _params) do
    changeset = Igcs.change_igc(%Igc{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"igc" => igc_params}) do
    case Igcs.create_igc(igc_params) do
      {:ok, igc} ->
        conn
        |> put_flash(:info, "Igc created successfully.")
        |> redirect(to: igc_path(conn, :show, igc))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    igc = Igcs.get_igc!(id)
    render(conn, "show.html", igc: igc)
  end

  def edit(conn, %{"id" => id}) do
    igc = Igcs.get_igc!(id)
    changeset = Igcs.change_igc(igc)
    render(conn, "edit.html", igc: igc, changeset: changeset)
  end

  def update(conn, %{"id" => id, "igc" => igc_params}) do
    igc = Igcs.get_igc!(id)

    case Igcs.update_igc(igc, igc_params) do
      {:ok, igc} ->
        conn
        |> put_flash(:info, "Igc updated successfully.")
        |> redirect(to: igc_path(conn, :show, igc))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", igc: igc, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    igc = Igcs.get_igc!(id)
    {:ok, _igc} = Igcs.delete_igc(igc)

    conn
    |> put_flash(:info, "Igc deleted successfully.")
    |> redirect(to: igc_path(conn, :index))
  end
end
