defmodule RaemWeb.SettingController do
  use RaemWeb, :controller

  alias Raem.FieldMappings
  alias Raem.FieldMappings.Setting
  alias Raem.Igcs.Igc
  alias Raem.Instituicoes.Instituicao
  alias Raem.Cursos.Curso
  alias Raem.Cpcs.Cpc

  def index(conn, _params) do
    settings = FieldMappings.list_settings()

    field_mappings = get_field_mappings()
    render(conn, "index.html", settings: settings, field_mappings: field_mappings)
  end

  defp get_field_mappings() do
    instituition = %{instituition: remove_keys(%Instituicao{})}
    igc = %{igc: remove_keys(%Igc{})}
    course = %{course: remove_keys(%Curso{})}
    cpc = %{cpc: remove_keys(%Cpc{})}
    {instituition, igc, course, cpc}
  end
  defp remove_keys(map) do
    map
    |> Map.keys()
    |> List.delete(:__meta__)
    |> List.delete(:__struct__)
    |> List.delete(:inserted_at)
    |> List.delete(:updated_at)
  end

  def new(conn, _params) do
    changeset = FieldMappings.change_setting(%Setting{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"setting" => setting_params}) do
    case FieldMappings.create_setting(setting_params) do
      {:ok, setting} ->
        conn
        |> put_flash(:info, "Setting created successfully.")
        |> redirect(to: setting_path(conn, :show, setting))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    setting = FieldMappings.get_setting!(id)
    render(conn, "show.html", setting: setting)
  end

  def edit(conn, %{"id" => id}) do
    setting = FieldMappings.get_setting!(id)
    changeset = FieldMappings.change_setting(setting)
    render(conn, "edit.html", setting: setting, changeset: changeset)
  end

  def update(conn, %{"id" => id, "setting" => setting_params}) do
    setting = FieldMappings.get_setting!(id)

    case FieldMappings.update_setting(setting, setting_params) do
      {:ok, setting} ->
        conn
        |> put_flash(:info, "Setting updated successfully.")
        |> redirect(to: setting_path(conn, :show, setting))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", setting: setting, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    setting = FieldMappings.get_setting!(id)
    {:ok, _setting} = FieldMappings.delete_setting(setting)

    conn
    |> put_flash(:info, "Setting deleted successfully.")
    |> redirect(to: setting_path(conn, :index))
  end
end
