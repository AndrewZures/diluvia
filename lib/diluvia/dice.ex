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
    calculate(poss_per_dice, [])
    |> List.flatten
    |> Enum.sort
  end

  def calculate([head | []], state) do
    state_sum = Enum.reduce(state, 0, fn(x, acc) -> x + acc end)
    Enum.map(head, fn(el) -> state_sum + el end)
  end

  def calculate([head | tail], state) do
    Enum.map(head, fn(el) -> calculate(tail, state ++ [el]) end)
  end

end
