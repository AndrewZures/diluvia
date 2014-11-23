defmodule Diluvia.Dice do

  @d4  [1,2,3,4]
  @d6  [1,2,3,4,5,6]
  @d8  [1,2,3,4,5,6,7,8]
  @d10 [1,2,3,4,5,6,7,8,9,10]
  @d12 [1,2,3,4,5,6,7,8,9,10,11,12]
  @d20 [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

  def possibilities(die) do
    match = prematch(die)
    if match, do: match, else: Enum.to_list(1..die)
  end


  def all_possibilities(dice) do
    Enum.map(dice, fn(die) -> possibilities(die) end)
  end

  def roll(dice) do
    :random.seed(:os.timestamp)
    all_possibilities(dice) |> all_options |> Enum.count |> :random.uniform
  end

  def all_options(options_per_dice) do
    calculate(options_per_dice, []) |> List.flatten |> Enum.sort
  end

  def calculate([head | []], dice_state) do
    state_sum = Enum.reduce(dice_state, 0, fn(x, acc) -> x + acc end)
    Enum.map(head, fn(el) -> state_sum + el end)
  end

  def calculate([head | tail], state) do
    Enum.map(head, fn(el) -> calculate(tail, state ++ [el]) end)
  end

  def prematch(die) do
    case die do
      4 ->  @d4
      6 ->  @d6
      8 ->  @d8
      10 -> @d10
      12 -> @d12
      20 -> @d20
      _ -> false
    end
  end

end
