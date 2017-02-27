defmodule CSVReader do
  require Integer

  def read(filename) do
    File.stream!(filename)
    |> Stream.map(&filter_line2/1)
    |> Stream.into(File.stream!(filename <> "out.csv"))
    |> Stream.run
  end

  defp filter_line(line) do
    String.downcase(line)
    |> String.split(",")
    |> Enum.with_index
    |> Enum.filter(fn ({_, index}) -> Integer.is_even(index) end)
    |> Enum.map(fn ({x, index}) -> x end)
    |> Enum.join(",")
  end
  
  defp filter_line2(line) do
    String.downcase(line)
    |> String.split(",")
    |> Enum.with_index
    |> Enum.filter_map(fn ({_, index}) -> Integer.is_even(index) end, fn ({x, index}) -> x end)
    |> Enum.join(",")
  end
end

CSVReader.read("test.csv")
