defmodule Diluvia.DB.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://postgres:postgres@localhost/diluvia"
  end

  def priv do
    app_dir(:diluvia, "priv/repo")
  end


end
