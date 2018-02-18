defmodule MangoWeb.PageController do
  use MangoWeb, :controller
  alias Mango.Catalog

  def index(conn, _params) do
    seasonal_products = Catalog.list_seasonal_products()
    new_conn = assign(conn, :seasonal_products, seasonal_products)
    render new_conn, "index.html"
  end
end
