defmodule M3uCreator do
  @moduledoc """
  Documentation for M3uCreator.
  """

  import M3uCreator.CLI, only: [ parse_args: 1 ]

  @doc """
  App entry point.
  """
  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  defp process(:help) do
    IO.puts """
    
      usage:  m3u_creator <path>
    """
    System.halt
  end
end
