defmodule M3uCreator do
  @moduledoc """
  Documentation for M3uCreator.
  """

  import M3uCreator.CLI, only: [ parse_args: 1 ]

  @doc """
  App entry point.
  """
  def main(argv) do
    M3uCreator.CLI.parse_args(argv)
  end
end
