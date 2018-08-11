defmodule Up.ImagesTest do
  use Up.DataCase

  alias Up.Images

  describe "image_sets" do
    alias Up.Images.ImageSet

    @valid_attrs %{name: "some name", token: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{name: "some updated name", token: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{name: nil, token: nil}

    def image_set_fixture(attrs \\ %{}) do
      {:ok, image_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Images.create_image_set()

      image_set
    end

    test "list_image_sets/0 returns all image_sets" do
      image_set = image_set_fixture()
      assert Images.list_image_sets() == [image_set]
    end

    test "get_image_set!/1 returns the image_set with given id" do
      image_set = image_set_fixture()
      assert Images.get_image_set!(image_set.id) == image_set
    end

    test "create_image_set/1 with valid data creates a image_set" do
      assert {:ok, %ImageSet{} = image_set} = Images.create_image_set(@valid_attrs)
      assert image_set.name == "some name"
      assert image_set.token == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_image_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Images.create_image_set(@invalid_attrs)
    end

    test "update_image_set/2 with valid data updates the image_set" do
      image_set = image_set_fixture()
      assert {:ok, image_set} = Images.update_image_set(image_set, @update_attrs)
      assert %ImageSet{} = image_set
      assert image_set.name == "some updated name"
      assert image_set.token == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_image_set/2 with invalid data returns error changeset" do
      image_set = image_set_fixture()
      assert {:error, %Ecto.Changeset{}} = Images.update_image_set(image_set, @invalid_attrs)
      assert image_set == Images.get_image_set!(image_set.id)
    end

    test "delete_image_set/1 deletes the image_set" do
      image_set = image_set_fixture()
      assert {:ok, %ImageSet{}} = Images.delete_image_set(image_set)
      assert_raise Ecto.NoResultsError, fn -> Images.get_image_set!(image_set.id) end
    end

    test "change_image_set/1 returns a image_set changeset" do
      image_set = image_set_fixture()
      assert %Ecto.Changeset{} = Images.change_image_set(image_set)
    end
  end
end
