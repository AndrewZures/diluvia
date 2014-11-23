defmodule Diluvia.Test.RandomDiceTest do
  use ExUnit.Case, async: true
  alias Diluvia.Dice, as: Dice

  @moduletag :random

  test "rolls a random number" do
    uniq_rolls = Enum.map(1..100, fn(_) -> Dice.roll([2]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [1,2]
  end

  test "rolls a random number for 4 dice" do
    uniq_rolls = Enum.map(1..200, fn(_) -> Dice.roll([4]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [1,2,3,4]
  end

end
