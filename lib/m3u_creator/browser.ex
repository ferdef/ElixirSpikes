defmodule M3uCreator.Browser do
  def files(path, files_list) do
    File.ls(path)
    |> case do
      {:ok, content} ->
        content
        |> Enum.each(fn x ->
          case File.stat(x) do
            {:ok, content} ->
              case content do
                %{type: :regular}} ->
                  files_list = files_list ++ x
                %{type: :directory}} ->
                  files(x, files_list)
              end
            {:error, _} -> IO.puts("Error")
          end
        end)
      {:error, _} -> files_list
    end
    files_list
  end
end
