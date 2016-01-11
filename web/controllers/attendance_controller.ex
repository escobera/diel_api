defmodule DielApi.AttendanceController do
  use DielApi.Web, :controller

  alias DielApi.Attendance

  plug :scrub_params, "attendance" when action in [:create, :update]

  def index(conn, _params) do
    attendances = Repo.all(Attendance)
    render(conn, "index.json", attendances: attendances)
  end

  def create(conn, %{"attendance" => attendance_params}) do
    changeset = Attendance.changeset(%Attendance{}, attendance_params)

    case Repo.insert(changeset) do
      {:ok, attendance} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", attendance_path(conn, :show, attendance))
        |> render("show.json", attendance: attendance)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DielApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    attendance = Repo.get!(Attendance, id)
    render(conn, "show.json", attendance: attendance)
  end

  def update(conn, %{"id" => id, "attendance" => attendance_params}) do
    attendance = Repo.get!(Attendance, id)
    changeset = Attendance.changeset(attendance, attendance_params)

    case Repo.update(changeset) do
      {:ok, attendance} ->
        render(conn, "show.json", attendance: attendance)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DielApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    attendance = Repo.get!(Attendance, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(attendance)

    send_resp(conn, :no_content, "")
  end
end
