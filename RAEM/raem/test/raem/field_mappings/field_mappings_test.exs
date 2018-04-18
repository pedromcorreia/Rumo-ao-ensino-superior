defmodule Raem.FieldMappingsTest do
  use Raem.DataCase

  alias Raem.FieldMappings

  describe "settings" do
    alias Raem.FieldMappings.Setting

    @valid_attrs %{field: "some field", from: "some from", to: "some to"}
    @update_attrs %{field: "some updated field", from: "some updated from", to: "some updated to"}
    @invalid_attrs %{field: nil, from: nil, to: nil}

    def setting_fixture(attrs \\ %{}) do
      {:ok, setting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FieldMappings.create_setting()

      setting
    end

    test "list_settings/0 returns all settings" do
      setting = setting_fixture()
      assert FieldMappings.list_settings() == [setting]
    end

    test "get_setting!/1 returns the setting with given id" do
      setting = setting_fixture()
      assert FieldMappings.get_setting!(setting.id) == setting
    end

    test "create_setting/1 with valid data creates a setting" do
      assert {:ok, %Setting{} = setting} = FieldMappings.create_setting(@valid_attrs)
      assert setting.field == "some field"
      assert setting.from == "some from"
      assert setting.to == "some to"
    end

    test "create_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FieldMappings.create_setting(@invalid_attrs)
    end

    test "update_setting/2 with valid data updates the setting" do
      setting = setting_fixture()
      assert {:ok, setting} = FieldMappings.update_setting(setting, @update_attrs)
      assert %Setting{} = setting
      assert setting.field == "some updated field"
      assert setting.from == "some updated from"
      assert setting.to == "some updated to"
    end

    test "update_setting/2 with invalid data returns error changeset" do
      setting = setting_fixture()
      assert {:error, %Ecto.Changeset{}} = FieldMappings.update_setting(setting, @invalid_attrs)
      assert setting == FieldMappings.get_setting!(setting.id)
    end

    test "delete_setting/1 deletes the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{}} = FieldMappings.delete_setting(setting)
      assert_raise Ecto.NoResultsError, fn -> FieldMappings.get_setting!(setting.id) end
    end

    test "change_setting/1 returns a setting changeset" do
      setting = setting_fixture()
      assert %Ecto.Changeset{} = FieldMappings.change_setting(setting)
    end
  end
end
