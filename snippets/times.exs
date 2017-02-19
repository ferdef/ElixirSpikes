defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n), do: n * 3

  def say_something(greet, name), do: (
    IO.puts greet
    IO.puts "How're you doing, #{name}?"
  )
end
