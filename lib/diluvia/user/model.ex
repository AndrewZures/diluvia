defmodule Diluvia.UserModel do
  use Ecto.Model

  schema "users" do
    field :username, :string
  end

end
