defmodule UpWeb.ImageSetView do
  use UpWeb, :view

  def render("show.svg", %{image_set: image_set}) do
    image_set.token
    |> EQRCode.encode()
    |> EQRCode.svg(%{width: 200})
  end
end
