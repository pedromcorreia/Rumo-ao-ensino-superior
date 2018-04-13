defmodule RaemWeb.DashboardController do
  use RaemWeb, :controller

  alias Raem.Dashboards
  alias Raem.Dashboards.Dashboard
  alias Raem.Cursos

  def index(conn, _params) do
    render conn, "index.html", list_courses: []
  end

  def create(conn, %{"id" => id}) do
    area_enquadramento = String.upcase(id)
    list_courses = Cursos.list_all_by(area_enquadramento, :area_enquadramento)
    render conn, "index.html", list_courses: list_courses
  end

  def show(conn, %{"id" => id}) do
    course = Cursos.get_curso_by_id(id)
    render conn, "show.html", course: course
  end
end
