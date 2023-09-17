defmodule Laiboonh.Factory do
  use ExMachina.Ecto, repo: Laiboonh.Repo
  use Laiboonh.RbacsFactory
end
