defmodule DielApi.AttendanceView do
  use DielApi.Web, :view

  def render("index.json", %{attendances: attendances}) do
    %{data: render_many(attendances, DielApi.AttendanceView, "attendance.json")}
  end

  def render("show.json", %{attendance: attendance}) do
    %{data: render_one(attendance, DielApi.AttendanceView, "attendance.json")}
  end

  def render("attendance.json", %{attendance: attendance}) do
    %{id: attendance.id,
      status: attendance.status,
      student_id: attendance.student_id}
  end
end
