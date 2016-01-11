defmodule DielApi.StudentView do
  use DielApi.Web, :view

  attributes [:name, :registration]

  def render("index.json", %{students: students}) do
    %{data: render_many(students, DielApi.StudentView, "student.json")}
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, DielApi.StudentView, "student.json")}
  end

  def render("student.json", %{student: student}) do
    %{id: student.id,
      name: student.name,
      registration: student.registration}
  end
end
