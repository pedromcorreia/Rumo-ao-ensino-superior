defmodule RaemWeb.CpcController do
  use RaemWeb, :controller

  alias Raem.Cpcs
  alias Raem.Cpcs.Cpc

  def index(conn, _params) do
    cpcs = Cpcs.list_cpcs()
    render(conn, "index.html", cpcs: cpcs)
  end

  def new(conn, _params) do
    changeset = Cpcs.change_cpc(%Cpc{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cpc" => cpc_params}) do
    case Cpcs.create_cpc(cpc_params) do
      {:ok, cpc} ->
        conn
        |> put_flash(:info, "Cpc created successfully.")
        |> redirect(to: cpc_path(conn, :show, cpc))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cpc = Cpcs.get_cpc!(id)
    render(conn, "show.html", cpc: cpc)
  end

  def edit(conn, %{"id" => id}) do
    cpc = Cpcs.get_cpc!(id)
    changeset = Cpcs.change_cpc(cpc)
    render(conn, "edit.html", cpc: cpc, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cpc" => cpc_params}) do
    cpc = Cpcs.get_cpc!(id)

    case Cpcs.update_cpc(cpc, cpc_params) do
      {:ok, cpc} ->
        conn
        |> put_flash(:info, "Cpc updated successfully.")
        |> redirect(to: cpc_path(conn, :show, cpc))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cpc: cpc, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cpc = Cpcs.get_cpc!(id)
    {:ok, _cpc} = Cpcs.delete_cpc(cpc)

    conn
    |> put_flash(:info, "Cpc deleted successfully.")
    |> redirect(to: cpc_path(conn, :index))
  end
end
