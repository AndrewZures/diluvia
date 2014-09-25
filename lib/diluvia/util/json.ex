defmodule JSON do

  def to_json (data) do
    Poison.encode!(data)
  end

  def from_json (data) do
    Poison.Parser.parse(data, keys: :atoms!)
  end

end
