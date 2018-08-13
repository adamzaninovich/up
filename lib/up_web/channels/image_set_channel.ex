defmodule UpWeb.ImageSetChannel do
  use UpWeb, :channel

  def join("image_set:" <> id, _params, socket) do
    {:ok, assign(socket, :image_set_id, id)}
  end
end
