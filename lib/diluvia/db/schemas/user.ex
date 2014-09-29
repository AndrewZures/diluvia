defmodule Diluvia.DB.Users do
  use Ecto.Model.Schema

  schema "users" do
    field :name, :string
  end

end
