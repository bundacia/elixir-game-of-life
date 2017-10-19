defmodule GolWeb.PageController do
  use GolWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
