import Integer

m = %{a: 1, c: 3}

a = with {:ok, res} <- Map.fetch(m, :a),
  true <- Integer.is_even(res) do
        IO.puts "Divided by 2 it is #{div(res, 2)}"
  else 
      :error -> IO.puts "We don't have this item in map"
        _ -> IO.puts "It's not odd"
  end
