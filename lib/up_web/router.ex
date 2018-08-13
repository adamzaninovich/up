defmodule UpWeb.Router do
  use UpWeb, :router

  pipeline :browser do
    plug(:accepts, ["html", "svg"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :browser_without_forgery_protection do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:put_secure_browser_headers)
  end

  # pipeline :api do
  #   plug(:accepts, ["json"])
  # end

  scope "/", UpWeb do
    pipe_through(:browser)

    get("/", ImageSetController, :index)
    resources("/image_sets", ImageSetController)
    resources("/images", ImageController, only: [:show, :delete])
  end

  scope "/", UpWeb do
    pipe_through(:browser_without_forgery_protection)

    post("/images/create_multiple", ImageController, :create_multiple)
  end

  # scope "/api", UpWeb do
  #   pipe_through(:api)
  # end
end
