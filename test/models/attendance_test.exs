defmodule DielApi.AttendanceTest do
  use DielApi.ModelCase

  alias DielApi.Attendance

  @valid_attrs %{status: 42, student_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Attendance.changeset(%Attendance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Attendance.changeset(%Attendance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
