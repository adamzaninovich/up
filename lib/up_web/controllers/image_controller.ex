defmodule UpWeb.ImageController do
  use UpWeb, :controller

  alias Up.Images
  alias Up.Images.ImageSet

  def create_multiple(conn, %{"token" => image_set_token, "images" => uploads}) do
    case Images.create_images(image_set_token, uploads) do
      {:ok, %ImageSet{} = set} ->
        UpWeb.Endpoint.broadcast("image_set:#{set.id}", "reload", %{reason: "new images"})

        conn
        |> put_status(:created)
        |> put_resp_header("location", image_set_path(conn, :show, set))
        |> render("create_multiple.json", image_set: set)

      thing ->
        IO.puts("NOOOOOOOOO")
        IO.inspect(thing)
        conn
    end
  end

  def create_multiple(conn, %{"token" => image_set_token}) do
    set = Images.get_image_set_by_token(image_set_token)

    conn
    |> put_status(:ok)
    |> put_resp_header("location", image_set_path(conn, :show, set))
    |> render("create_multiple.json", image_set: set)
  end

  def show(conn, %{"id" => id}) do
    id
    |> Images.get_image!()
    |> send_image(conn)
  end

  defp send_image(image, conn) do
    conn
    |> put_resp_content_type(image.binary_type, "utf-8")
    |> send_resp(200, image.binary_data)
  end
end
