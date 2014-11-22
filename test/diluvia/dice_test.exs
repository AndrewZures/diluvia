defmodule Diluvia.DiceTest do
  use ExUnit.Case, async: true
  alias Diluvia.Dice, as: Dice

  test "generates all possibilities for six-sided die" do
    outcomes = Dice.all_possibilities([6])
    assert outcomes == [[1,2,3,4,5,6]]
  end

  test "generates all possibilities for two six-sided die" do
    outcomes = Dice.all_possibilities([6, 6])
    assert outcomes == [[1,2,3,4,5,6], [1,2,3,4,5,6]]
  end

  test "generates all possibilities for a d6 and d8" do
    outcomes = Dice.all_possibilities([6, 8])
    assert outcomes == [[1,2,3,4,5,6], [1,2,3,4,5,6,7,8]]
  end

  test "replicates many" do
    data = [{2, 2}, {4, 3}]
    assert Dice.duplicate_many(data) == [[2,2],[4,4,4]]
  end

  test "replicates many and flattens" do
    data = [{2, 2}, {4, 3}]
    assert Dice.flat_duplicate_many(data) == [2,2,4,4,4]
  end

  test "calculates final array" do
    d6 = [1,2,3,4,5,6]
    dice = [d6]
    state = [1]
    assert Dice.calculate(dice, state) == [2,3,4,5,6,7]
  end

  test "calculates final array with multi-state" do
    d6 = [1,2,3,4,5,6]
    dice = [d6]
    state = [1,2,3]
    assert Dice.calculate(dice, state) == [7,8,9,10,11,12]
  end

  test "calculates non-final array" do
    d6 = [1,2,3,4,5,6]
    data = [{2,1},{3,2},{4,3},{5,4},{6,5},{7,6},{12,1},{11,2},{10,3},{9,4},{8,5}]
    dice = [d6, d6]
    expected = Enum.sort(Dice.flat_duplicate_many(data))
    assert  Dice.generate_stuff(dice) == expected
  end

end
