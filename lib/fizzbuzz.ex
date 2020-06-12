defmodule KataFizzbuzz do
  def calculate(count) do
    Enum.map(1..count, &result/1)
    |> Enum.join("\n")
  end

  defp result(x) when rem(x, 3) == 0 and rem(x, 5) == 0, do: "FizzBuzz"
  defp result(x) when rem(x, 3) == 0, do: "Fizz"
  defp result(x) when rem(x, 5) == 0, do: "Buzz"
  defp result(x), do: to_string(x)
end
