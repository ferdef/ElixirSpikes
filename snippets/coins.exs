defmodule Currency do
  def make_change(amount) do
    initial = %{
      H: 0, Q: 0, D: 0, N: 0, P: 0
    }
    calc(amount, initial)
    |> Enum.filter(fn {k, v} -> v > 0 end)
    |> Enum.into(%{})
  end
              
  defp calc(0, solution), do: solution
  defp calc(n, solution) do
    cond do
      n >= 50 ->
        current = solution[:H]
        calc(n-50, %{solution | H: (current + 1)})
      n >= 25 ->
        current = solution[:Q]
        calc(n-25, %{solution | Q: (current + 1)})
      n >= 10 ->
        current = solution[:D]
        calc(n-10, %{solution | D: (current + 1)})
      n >= 5 ->
        current = solution[:N]
        calc(n-5, %{solution | N: (current + 1)})
      true ->
        current = solution[:P]
        calc(n-1, %{solution | P: (current + 1)})
    end
  end

  # Other's solutions
  
  @coins [H: 50, Q: 25, D: 10, N: 5, P: 1]

  def make_change_2(amount) do
    @coins
    |> Stream.transform(amount, fn({name, value}, amount) ->
      {[{name, div(amount, value)}], rem(amount, value)}
    end)
    |> Stream.filter(fn {_, v} -> v != 0 end)
    |> Enum.into(%{})
  end
end
