Diluvia
=======

** TODO: Add description **

### Server
to run server: mix run --no-halt lib/diluvia/router.ex

### Migrations
generate migration: mix ecto.gen.migration Elixir.Diluvia.DB.Repo <% migration_name %>

#### Dev
MIX_ENV=dev mix ecto.migrate Diluvia.DB.Repo
MIX_ENV=test mix exto.migrate Diluvia.DB.Repo
  * add the '--all' flag to execute all migrations

MIX_ENV=dev mix ecto.rollback Diluvia.DB.Repo
MIX_ENV=test mix ecto.rollback Diluvia.DB.Repo
  * add the '--all' flag to execute all migrations
