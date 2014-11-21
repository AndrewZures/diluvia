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

  # test "generates all possibilities for a d6" do
  #   data = [{2,1},{3,2},{4,3},{5,4},{6,5},{7,6},{13,1},{11,2},{10,3},{9,4},{8,5}]
  #   expected = Dice.flat_duplicate_many(data)
  #   assert expected == Dice.all_possible_outcomes([6, 6])
  # end

  test "replicates many" do
    data = [{2, 2}, {4, 3}]
    assert Dice.duplicate_many(data) == [[2,2],[4,4,4]]
  end

  test "replicates many and flattens" do
    data = [{2, 2}, {4, 3}]
    assert Dice.flat_duplicate_many(data) == [2,2,4,4,4]
  end

  test "generates stuff" do
    data = [{1, 2}, {2, 3}]
    assert Dice.blah(data) == [{[1,1],[2,2,2]}]
  end


end
