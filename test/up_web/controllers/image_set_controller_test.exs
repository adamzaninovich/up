defmodule UpWeb.ImageSetControllerTest do
  use UpWeb.ConnCase

  alias Up.Images

  @create_attrs %{name: "some name", token: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{name: "some updated name", token: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{name: nil, token: nil}

  def fixture(:image_set) do
    {:ok, image_set} = Images.create_image_set(@create_attrs)
    image_set
  end

  describe "index" do
    test "lists all image_sets", %{conn: conn} do
      conn = get conn, image_set_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Image sets"
    end
  end

  describe "new image_set" do
    test "renders form", %{conn: conn} do
      conn = get conn, image_set_path(conn, :new)
      assert html_response(conn, 200) =~ "New Image set"
    end
  end

  describe "create image_set" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, image_set_path(conn, :create), image_set: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == image_set_path(conn, :show, id)

      conn = get conn, image_set_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Image set"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, image_set_path(conn, :create), image_set: @invalid_attrs
      assert html_response(conn, 200) =~ "New Image set"
    end
  end

  describe "edit image_set" do
    setup [:create_image_set]

    test "renders form for editing chosen image_set", %{conn: conn, image_set: image_set} do
      conn = get conn, image_set_path(conn, :edit, image_set)
      assert html_response(conn, 200) =~ "Edit Image set"
    end
  end

  describe "update image_set" do
    setup [:create_image_set]

    test "redirects when data is valid", %{conn: conn, image_set: image_set} do
      conn = put conn, image_set_path(conn, :update, image_set), image_set: @update_attrs
      assert redirected_to(conn) == image_set_path(conn, :show, image_set)

      conn = get conn, image_set_path(conn, :show, image_set)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, image_set: image_set} do
      conn = put conn, image_set_path(conn, :update, image_set), image_set: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Image set"
    end
  end

  describe "delete image_set" do
    setup [:create_image_set]

    test "deletes chosen image_set", %{conn: conn, image_set: image_set} do
      conn = delete conn, image_set_path(conn, :delete, image_set)
      assert redirected_to(conn) == image_set_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, image_set_path(conn, :show, image_set)
      end
    end
  end

  defp create_image_set(_) do
    image_set = fixture(:image_set)
    {:ok, image_set: image_set}
  end
end
