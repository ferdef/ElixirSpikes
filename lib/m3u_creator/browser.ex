defmodule M3uCreator.Browser do
  def ls_r(path) do
    cond do
      File.regular?(path) -> [path]
      File.dir?(path) ->
        File.ls!(path)
        |> Enum.map(&Path.join(path, &1))
        |> Enum.map(&ls_r/1)
        |> Enum.concat
      true -> []
    end
  end

  def ls_folder(path) do
    File.ls!(path)
    |> Enum.map(&Path.join(path, &1))
    |> Enum.filter(&File.dir?(&1))
  end
end
