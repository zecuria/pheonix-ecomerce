defmodule MangoWeb.RegisterationController do
  use MangoWeb, :controller
  alias Mango.CRM

  def new(conn, _) do
    changeset = CRM.build_customer
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"registeration" => registeration_data} = params) do
  end
end