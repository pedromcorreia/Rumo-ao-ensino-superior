defmodule RaemWeb.Router do
  use RaemWeb, :router

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

  pipeline :login_plug do
    plug(RaemWeb.LoginPlug)
  end

  scope "/", RaemWeb do
    pipe_through [:browser, :login_plug] # Use the default browser stack


    get "/", PageController, :index
    resources "/users", UserController
    resources("/sessions", SessionController, only: [:new, :create])
    resources "/dashboards", DashboardController
    resources "/idds", IddController, except: [:delete, :new, :update]
    resources "/enades", EnadeController, except: [:delete, :new, :update]
    resources "/cpcs", CpcController, except: [:delete, :new, :update]
    resources "/instituicoes", InstituicoesController
    resources "/igcs", IgcController
  end
end
