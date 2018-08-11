defmodule UpWeb.Router do
  use UpWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", UpWeb do
    pipe_through(:browser)

    get("/", ImageSetController, :index)
    resources("/image_sets", ImageSetController)
    resources("/images", ImageController, only: [:update, :delete])
    create(unique_index(:image_sets, [:token]))
  end

  # Other scopes may use custom stacks.
  scope "/api", UpWeb do
    pipe_through(:api)
    resources("/images", ImageController, only: [:create])
  end
end
