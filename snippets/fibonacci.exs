defmodule Fibonacci do
  def fb(n) when n in 0..2, do: n
  def fb(n), do: fb(n-1) + fb(n-2)
end
