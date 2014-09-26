defmodule Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def up do
    "CREATE TABLE users (
    id serial primary key,
    name text
    );"
  end

  def down do
    "DROP TABLE users;"
  end
end
