defmodule Diluvia.BlahTest do
  use ExUnit.Case, async: true

  test 'queries something' do
    query = Diluvia.User.Queries.find(1)
    user = query |> hd

    assert user |> Map.get(:name) == "jimmy"
  end

  test 'function' do
    #character
    #|> race_data
    #|> class
    #|> background
    #|> armor
    #|> weapon
    #|> effect_mods
    #|> DM_mods
  end

end
