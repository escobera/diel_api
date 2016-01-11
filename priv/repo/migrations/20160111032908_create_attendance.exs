defmodule DielApi.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendances) do
      add :status, :boolean
      add :student_id, references(:students)

      timestamps
    end

  end
end
