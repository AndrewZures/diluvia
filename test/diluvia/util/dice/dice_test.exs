defmodule Diluvia.Test.DiceTest do
  use ExUnit.Case, async: true
  alias Diluvia.Dice, as: Dice
  alias Diluvia.Test.DiceUtil, as: DiceUtil

  @d6 [1,2,3,4,5,6]

  test "generates all possibilities for six-sided die" do
    outcomes = Dice.possibilities([6])
    assert outcomes == [@d6]
  end

  test "generates all possibilities for two six-sided die" do
    outcomes = Dice.possibilities([6, 6])
    assert outcomes == [[1,2,3,4,5,6], [1,2,3,4,5,6]]
  end

  test "generates all possibilities for a d6 and d8" do
    outcomes = Dice.possibilities([6, 8])
    assert outcomes == [[1,2,3,4,5,6], [1,2,3,4,5,6,7,8]]
  end

  test "replicates many" do
    data = [{2, 2}, {4, 3}]
    assert DiceUtil.duplicate_many(data) == [[2,2],[4,4,4]]
  end

  test "replicates many and flattens" do
    data = [{2, 2}, {4, 3}]
    assert DiceUtil.flat_duplicate_many(data) == [2,2,4,4,4]
  end

  test "calculates final array" do
    dice = [@d6]
    state = [1]
    assert Dice.calculate(dice, state) == [2,3,4,5,6,7]
  end

  test "calculates final array with multi-state" do
    dice = [@d6]
    state = [1,2,3]
    assert Dice.calculate(dice, state) == [7,8,9,10,11,12]
  end

  test "calculates different dice types" do
    d2 = [1,2]
    dice = [d2, @d6]
    assert Dice.all_options(dice) == [2,3,3,4,4,5,5,6,6,7,7,8]
  end

  test "calculates non-final array" do
    data = [{2,1},{3,2},{4,3},{5,4},{6,5},{7,6},{12,1},{11,2},{10,3},{9,4},{8,5}]
    dice = [@d6, @d6]
    expected = DiceUtil.flat_duplicate_many(data)
    assert  Dice.all_options(dice) == expected
  end


end
