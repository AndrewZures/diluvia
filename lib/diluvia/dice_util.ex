defmodule Diluvia.Test.DiceUtil do

  def all_possibilities(dice) do
    Enum.map(dice, fn(die) -> Enum.to_list(1..die) end)
  end

  def duplicate_many(data) do
    Enum.map(data, fn({v, t}) -> List.duplicate(v, t) end)
  end

  def flat_duplicate_many(data) do
    data |> duplicate_many |> List.flatten |> Enum.sort
  end

end
