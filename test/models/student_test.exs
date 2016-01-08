defmodule DielApi.StudentTest do
  use DielApi.ModelCase

  alias DielApi.Student

  @valid_attrs %{name: "some content", registration: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Student.changeset(%Student{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Student.changeset(%Student{}, @invalid_attrs)
    refute changeset.valid?
  end
end
