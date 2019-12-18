defmodule DbServerWeb.Router do
  use DbServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DbServerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/start", RequestController, :start_node
    get "/receive", RequestController, :receive_request
  end

  # Other scopes may use custom stacks.
  # scope "/api", DbServerWeb do
  #   pipe_through :api
  # end
end
