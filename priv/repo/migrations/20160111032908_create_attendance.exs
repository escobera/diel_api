defmodule DielApi.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendances) do
      add :status, :integer
      add :student_id, :integer

      timestamps
    end

  end
end
