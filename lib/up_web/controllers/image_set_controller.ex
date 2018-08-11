defmodule UpWeb.ImageSetController do
  use UpWeb, :controller

  alias Up.Images
  alias Up.Images.ImageSet

  def index(conn, _params) do
    image_sets = Images.list_image_sets()
    render(conn, "index.html", image_sets: image_sets)
  end

  def new(conn, _params) do
    changeset = Images.change_image_set(%ImageSet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"image_set" => image_set_params}) do
    case Images.create_image_set(image_set_params) do
      {:ok, image_set} ->
        conn
        |> put_flash(:info, "Image set created successfully.")
        |> redirect(to: image_set_path(conn, :show, image_set))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    image_set = Images.get_image_set!(id)
    render(conn, "show.html", image_set: image_set)
  end

  def edit(conn, %{"id" => id}) do
    image_set = Images.get_image_set!(id)
    changeset = Images.change_image_set(image_set)
    render(conn, "edit.html", image_set: image_set, changeset: changeset)
  end

  def update(conn, %{"id" => id, "image_set" => image_set_params}) do
    image_set = Images.get_image_set!(id)

    case Images.update_image_set(image_set, image_set_params) do
      {:ok, image_set} ->
        conn
        |> put_flash(:info, "Image set updated successfully.")
        |> redirect(to: image_set_path(conn, :show, image_set))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", image_set: image_set, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image_set = Images.get_image_set!(id)
    {:ok, _image_set} = Images.delete_image_set(image_set)

    conn
    |> put_flash(:info, "Image set deleted successfully.")
    |> redirect(to: image_set_path(conn, :index))
  end
end
