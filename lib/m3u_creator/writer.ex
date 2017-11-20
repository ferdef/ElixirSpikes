defmodule M3uCreator.Writer do
  @moduledoc """
  File writing related stuff
  """

  @doc """
    write a list of filepaths to a text file
  """
  def write(items_list, destination, extension) do
    file = File.open!(destination <> extension, [:write, :utf8])
    file |> inspect |> IO.puts
    items_list
    |> Enum.each(&IO.write(file, String.replace_prefix(&1, destination, "") <> "\n"))
  end
end
