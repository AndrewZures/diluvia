defmodule Diluvia.Mixfile do
  use Mix.Project

  def project do
    [app: :diluvia,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug, :ecto, :postgrex]]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 0.7.0"},
     {:poison, "~> 1.2.0"},
     {:ecto, "~> 0.2.5"},
     {:postgrex, ">= 0.0.0"}]
  end
end
