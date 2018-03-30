defmodule RaemWeb.DashboardController do
  use RaemWeb, :controller

  alias Raem.Dashboards
  alias Raem.Dashboards.Dashboard
  alias Raem.Idds

  def index(conn, _params) do
    list_courses = nil
    #render conn, "index.html", list_courses
    render conn, "index.html"
  end

  def create(conn, %{"id" => id}) do
    list_courses = Idds.get_by!(area_enquadramento: id)
    #render conn, "index.html", list_courses
    render conn, "index.html"
  end
end
