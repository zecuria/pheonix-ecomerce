defmodule MangoWeb.Acceptance.RegistrationsTest do
  use Mango.DataCase
  use Hound.Helpers

  hound_session()

  test "registers an accoutn with valid data" do
    navigate_to("/register")

    form = find_element(:id, "registeration-form")
    find_within_elemnt(form, :name, "registeration[name]")
    |> fill_field("John")

    find_within_elemnt(form, :name, "registeration[email]")
    |> fill_field("john@example.com")

    find_within_elemnt(form, :name, "registeration[phone]")
    |> fill_field("1111")

    find_within_elemnt(form, :name, "registeration[residence_area]")
    |> fill_field("Area 1")


    find_within_elemnt(form, :name, "registeration[password]")
    |> fill_field("password")

    
    find_within_elemnt(form, :tag, "button")
    |> click

    assert current_path == "/"
    message = find_element(:class, "alert")
              |> visible_text
    
    assert message == "Registeration successful"
  end

  test "shows error messages on invalid data" do
    navigate_to("/register")

    form = find_element(:id, "registeration-form")
    find_within_element(form, :tag, "button") |> click

    assert current_path() == "/register"
    message = find_element(:id, "form-error") |> visible_text()
    assert message == "Oops, something went wrong! Please check the errors below."
  end
end