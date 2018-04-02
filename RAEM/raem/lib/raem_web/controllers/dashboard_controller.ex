defmodule RaemWeb.DashboardController do
  use RaemWeb, :controller

  alias Raem.Dashboards
  alias Raem.Dashboards.Dashboard
  alias Raem.Idds

  def index(conn, _params) do
    render conn, "index.html", list_courses: []
  end

  def create(conn, %{"id" => id}) do
    area_enquadramento = String.upcase(id)
    list_courses = Idds.list_all_by(area_enquadramento, :area_enquadramento)
    render conn, "index.html", list_courses: list_courses
  end

  def show(conn, %{"id" => id}) do
    course = Idds.get_idd!(id)
    render conn, "show.html", course: course
  end
end
