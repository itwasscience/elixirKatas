defmodule KataRussianMultiplication do
  def mul(x, y) do
    lhs = subdivide(x, [])

    # Calculate the right-hand side
    Range.new(1, length(lhs) - 1)
    |> Enum.reduce([y], fn _, acc -> acc ++ [List.last(acc) * 2] end)
    |> Enum.with_index()
    |> Enum.reduce(0, fn x, acc ->
      {val, idx} = x
      if rem(Enum.at(lhs, idx), 2) != 0, do: acc + val, else: acc
    end)
  end

  defp subdivide(1, vals) do
    vals ++ [1]
  end

  defp subdivide(x, vals) do
    subdivide(div(x, 2), vals ++ [x])
  end
end
