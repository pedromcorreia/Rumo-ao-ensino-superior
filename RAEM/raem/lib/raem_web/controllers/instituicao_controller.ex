defmodule RaemWeb.InstituicaoController do
  use RaemWeb, :controller

  alias Raem.Instituicoes
  alias Raem.Instituicoes.Instituicao

  def index(conn, _params) do
    instituicoes = Instituicoes.list_instituicoes()
    render(conn, "index.html", instituicoes: instituicoes)
  end

  def new(conn, _params) do
    changeset = Instituicoes.change_instituicao(%Instituicao{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"instituicao" => instituicao_params}) do
    case Instituicoes.create_instituicao(instituicao_params) do
      {:ok, instituicao} ->
        conn
        |> put_flash(:info, "Instituicao created successfully.")
        |> redirect(to: instituicao_path(conn, :show, instituicao))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    instituicao = Instituicoes.get_instituicao!(id)
    render(conn, "show.html", instituicao: instituicao)
  end

  def edit(conn, %{"id" => id}) do
    instituicao = Instituicoes.get_instituicao!(id)
    changeset = Instituicoes.change_instituicao(instituicao)
    render(conn, "edit.html", instituicao: instituicao, changeset: changeset)
  end

  def update(conn, %{"id" => id, "instituicao" => instituicao_params}) do
    instituicao = Instituicoes.get_instituicao!(id)

    case Instituicoes.update_instituicao(instituicao, instituicao_params) do
      {:ok, instituicao} ->
        conn
        |> put_flash(:info, "Instituicao updated successfully.")
        |> redirect(to: instituicao_path(conn, :show, instituicao))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", instituicao: instituicao, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    instituicao = Instituicoes.get_instituicao!(id)
    {:ok, _instituicao} = Instituicoes.delete_instituicao(instituicao)

    conn
    |> put_flash(:info, "Instituicao deleted successfully.")
    |> redirect(to: instituicao_path(conn, :index))
  end
end
