defmodule Diluvia.Test.RandomDiceTest do
  use ExUnit.Case, async: true
  alias Diluvia.Dice, as: Dice

  @moduletag :random

  test "rolls a random number" do
    uniq_rolls = Enum.map(1..100, fn(_) -> Dice.roll([2]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [1,2]
  end

  test "rolls a random number for a single d4" do
    uniq_rolls = Enum.map(1..200, fn(_) -> Dice.roll([4]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [1,2,3,4]
  end

  test "rolls a random number for a single d6" do
    uniq_rolls = Enum.map(1..200, fn(_) -> Dice.roll([6]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [1,2,3,4,5,6]
  end

  test "rolls a random number for a single d8" do
    uniq_rolls = Enum.map(1..200, fn(_) -> Dice.roll([8]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [1,2,3,4,5,6,7,8]
  end

  test "rolls a random number for two d4" do
    uniq_rolls = Enum.map(1..200, fn(_) -> Dice.roll([4,4]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [2,3,4,5,6,7,8]
  end

  test "rolls a random number for two d6" do
    uniq_rolls = Enum.map(1..200, fn(_) -> Dice.roll([6,6]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [2,3,4,5,6,7,8,9,10,11,12]
  end

  test "rolls a random number for two d6 and d4" do
    uniq_rolls = Enum.map(1..200, fn(_) -> Dice.roll([6,6,4]) end)
                 |> Enum.uniq |> Enum.sort
    assert uniq_rolls == [3,4,5,6,7,8,9,10,11,12,13,14,15,16]
  end

end
