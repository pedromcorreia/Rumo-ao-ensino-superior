defmodule RaemWeb.DashboardController do
  use RaemWeb, :controller

  alias Raem.Dashboards
  alias Raem.Dashboards.Dashboard

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
