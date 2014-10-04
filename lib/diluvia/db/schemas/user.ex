defmodule Diluvia.DB.Users do
  use Ecto.Model

  schema "users" do
    field :name, :string
  end

end
