defmodule UpWeb.ImageView do
  use UpWeb, :view

  def render("create_multiple.json", %{image_set: image_set}) do
    %{data: render_many(image_set.images, UpWeb.ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{
      index: image.index,
      binary_type: image.binary_type,
      path: image_path(UpWeb.Endpoint, :show, image)
    }
  end

  def display_image(conn, image, attrs \\ []) do
    image_src = image_path(conn, :show, image)
    attrs = attrs ++ [src: image_src, alt: "#{image.image_set_id}-#{image.id}"]
    tag(:img, attrs)
  end
end
