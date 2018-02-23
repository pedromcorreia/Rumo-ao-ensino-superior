defmodule RaesWeb.PageController do
  use RaesWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
