defmodule RaemWeb.SettingControllerTest do
  use RaemWeb.ConnCase

  alias Raem.FieldMappings

  @create_attrs %{field: "some field", from: "some from", to: "some to"}
  @update_attrs %{field: "some updated field", from: "some updated from", to: "some updated to"}
  @invalid_attrs %{field: nil, from: nil, to: nil}

  def fixture(:setting) do
    {:ok, setting} = FieldMappings.create_setting(@create_attrs)
    setting
  end

  describe "index" do
    test "lists all settings", %{conn: conn} do
      conn = get conn, setting_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Settings"
    end
  end

  describe "new setting" do
    test "renders form", %{conn: conn} do
      conn = get conn, setting_path(conn, :new)
      assert html_response(conn, 200) =~ "New Setting"
    end
  end

  describe "create setting" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, setting_path(conn, :create), setting: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == setting_path(conn, :show, id)

      conn = get conn, setting_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Setting"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, setting_path(conn, :create), setting: @invalid_attrs
      assert html_response(conn, 200) =~ "New Setting"
    end
  end

  describe "edit setting" do
    setup [:create_setting]

    test "renders form for editing chosen setting", %{conn: conn, setting: setting} do
      conn = get conn, setting_path(conn, :edit, setting)
      assert html_response(conn, 200) =~ "Edit Setting"
    end
  end

  describe "update setting" do
    setup [:create_setting]

    test "redirects when data is valid", %{conn: conn, setting: setting} do
      conn = put conn, setting_path(conn, :update, setting), setting: @update_attrs
      assert redirected_to(conn) == setting_path(conn, :show, setting)

      conn = get conn, setting_path(conn, :show, setting)
      assert html_response(conn, 200) =~ "some updated field"
    end

    test "renders errors when data is invalid", %{conn: conn, setting: setting} do
      conn = put conn, setting_path(conn, :update, setting), setting: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Setting"
    end
  end

  describe "delete setting" do
    setup [:create_setting]

    test "deletes chosen setting", %{conn: conn, setting: setting} do
      conn = delete conn, setting_path(conn, :delete, setting)
      assert redirected_to(conn) == setting_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, setting_path(conn, :show, setting)
      end
    end
  end

  defp create_setting(_) do
    setting = fixture(:setting)
    {:ok, setting: setting}
  end
end
