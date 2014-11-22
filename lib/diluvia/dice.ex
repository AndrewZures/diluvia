defmodule Diluvia.Dice do

  def all_possibilities(dice) do
    Enum.map(dice, fn(die) -> Enum.to_list(1..die) end)
  end

  def all_possible_outcomes(dice) do
    possibilities = all_possibilities(dice)
  end

  def duplicate_many(data) do
    Enum.map(data, fn({v, t}) -> List.duplicate(v, t) end)
  end

  def flat_duplicate_many(data) do
    data |> duplicate_many |> List.flatten
  end

  def generate_stuff(poss_per_dice) do
    indexed = Enum.with_index(poss_per_dice)
    all_but_last = Enum.take(indexed, length(indexed) - 1)
    hi = Enum.map(all_but_last, fn(list) -> add_lists(list, indexed) end)
    Enum.sort(List.flatten(hi))
  end

  def add_lists(list, original) do
    result = Enum.map(original, fn(org) -> something(org, list) end)
    Enum.filter(result, fn(e) -> e != nil end)
  end

  def something({a_list, a_idx}, {b_list, b_idx}) do
    if a_idx != b_idx do
      if a_list > b_list do
        Enum.map(a_list, fn(a) -> Enum.map(b_list, fn(b) -> a + b end) end)
      else
        Enum.map(b_list, fn(b) -> Enum.map(a_list, fn(a) -> a + b end) end)
      end
    end
  end

  def blah(dice) do
    # dup = duplicate_many(dice)
    dup = all_possibilities(dice)
    generate_stuff(dup)
  end

end
