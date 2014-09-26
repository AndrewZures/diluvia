defmodule Diluvia.BlahTest do
  use ExUnit.Case, async: true
  import Diluvia.DB.Queries

  test 'queries something' do
    assert sample_query |> hd == "jimmy"
  end

end
