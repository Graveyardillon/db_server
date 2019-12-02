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
  end

  scope "/game", DbServerWeb.API do
    pipe_through :api

    get "/", GameController, :index
  end
end
