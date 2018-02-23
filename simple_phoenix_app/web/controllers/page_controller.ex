defmodule SimplePhoenixApp.PageController do
  use SimplePhoenixApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
