defmodule Diluvia.Test.RandomDiceTest do
  use ExUnit.Case, async: true
  alias Diluvia.Dice, as: Dice

  @moduletag :random

  test "rolls a random number" do
    uniq_rolls = uniq_outcomes([2])
    assert uniq_rolls == [1,2]
  end

  test "rolls a random number for single d4" do
    uniq_rolls = uniq_outcomes([4])
    assert uniq_rolls == Enum.to_list(1..4)
  end

  test "rolls a random number for single d6" do
    uniq_rolls = uniq_outcomes([6])
    assert uniq_rolls == Enum.to_list(1..6)
  end

  test "rolls a random number for single d8" do
    uniq_rolls = uniq_outcomes([8])
    assert uniq_rolls == Enum.to_list(1..8)
  end

  test "rolls a random number for two d4" do
    uniq_rolls = uniq_outcomes([4,4])
    assert uniq_rolls == Enum.to_list(2..8)
  end

  test "rolls a random number for two d6" do
    uniq_rolls = uniq_outcomes([6,6])
    assert uniq_rolls == Enum.to_list(2..12)
  end

  test "rolls a random number for two d6 and d4" do
    uniq_rolls = uniq_outcomes([6,6,4], 300)
    assert uniq_rolls == Enum.to_list(3..16)
  end

  test "rolls a random number for four d4" do
    uniq_rolls = uniq_outcomes([4,4,4,4], 300)
    assert uniq_rolls == Enum.to_list(4..16)
  end

  def uniq_outcomes(dice, n \\ 200) do
    Enum.map(1..n, fn(_) -> Dice.roll(dice) end) |> Enum.uniq |> Enum.sort
  end

end
