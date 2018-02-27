defmodule RaemWeb.PageController do
  use RaemWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
