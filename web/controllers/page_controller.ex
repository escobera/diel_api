defmodule DielApi.PageController do
  use DielApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
