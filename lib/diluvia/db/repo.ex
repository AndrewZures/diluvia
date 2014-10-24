defmodule Diluvia.DB.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  def conf(env), do: parse_url url(env)
  defp url(:dev), do: "ecto://postgres:postgres@localhost/diluvia-dev"
  defp url(:test), do: "ecto://postgres:postgres@localhost/diluvia-test"

  def priv do
    app_dir(:diluvia, "priv/repo")
  end


end
