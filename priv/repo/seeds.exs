# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DielApi.Repo.insert!(%DielApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DielApi.Student
alias DielApi.Repo

defmodule DielApi.Seeds.Students do
  def create_students(student_list_string) do
    String.split(student_list_string, "\n") |> Enum.map( fn(name) -> create_student(name) end )
  end

  def create_student(student_name) do
    :random.seed(:erlang.now)
    student = %Student{ name: student_name, registration: Integer.to_string(:random.uniform(10000))}
    Repo.insert!(student)
  end
end

DielApi.Seeds.Students.create_students(
  "Melodi Wolski
Josue Fessenden
Jonie Barnhardt
Layla Shibata
Quentin Kyte 
Leif Bechard 
Sterling Silversmith
Rodrigo Kouba
Roman Flansburg
Zenia Prather"
)


