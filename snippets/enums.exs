defmodule TestingEnums do
  def execute(n) do
    (1..n)
    |> Enum.map(&(trib(&1, {1, 1, 1})))
  end
  def trib(0, _), do: []
  def trib(n, base) when n in 1..3, do: elem(base, n-1)
  def trib(n, base) do
    trib(n-1, base) + trib(n-2, base) + trib(n-3, base)
  end
end
