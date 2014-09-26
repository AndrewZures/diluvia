defmodule Diluvia.BlahTest do
  use ExUnit.Case, async: true
  import Diluvia.DB.Queries
  import Diluvia.Util

  test 'queries something' do
    assert sample_query |> hd |> Map.get(:name) == "jimmy"
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
