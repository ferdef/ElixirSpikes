defmodule M3uCreator do
  @moduledoc """
  Documentation for M3uCreator.
  """
  import M3uCreator.CLI, only: [ parse_args: 1 ]
  import M3uCreator.Browser, only: [ ls_r: 1, ls_folder: 1 ]
  import M3uCreator.Writer, only: [ write: 3 ]

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

      usage:  m3u_creator [-c|--concurrent] <path>

      -c concurrently process each folder
    """
    System.halt
  end

  defp process({path, :concurrent}) do
    IO.puts "concurrent #{path}"
    path
    |> ls_folder
    |> Enum.map(fn folder->
      Task.async(fn ->
        IO.puts("Processing #{folder}")
        ls_r(folder) |> write(folder, ".m3u")
      end)
    end)
    |> Task.yield_many
  end

  defp process(path) do
    path
    |> ls_folder
    |> Enum.each(fn folder->
      IO.puts("Processing #{folder}")
      ls_r(folder) |> write(folder, ".m3u")
    end)
  end

  def m3u_create(folder) do
    IO.puts("Processing #{folder}")
    ls_r(folder) |> write(folder, ".m3u")
  end
end
