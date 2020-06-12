defmodule KataFromRoman do
  def parse(string) do
    is_valid?(string)
    |> calculate
  end

  defp calculate({:ok, str} = _input) do
    result =
      String.reverse(str)
      |> String.graphemes()
      |> Enum.reduce({0, 0}, fn x, {acc, prev} ->
        cur = value(x)
        if cur < prev, do: {acc - cur, cur}, else: {acc + cur, cur}
      end)
      |> elem(0)
      |> to_string()

    {:ok, result}
  end

  defp calculate({:error, _} = input), do: input

  defp value("I" = _), do: 1
  defp value("V" = _), do: 5
  defp value("X" = _), do: 10
  defp value("L" = _), do: 50
  defp value("C" = _), do: 100
  defp value("D" = _), do: 500
  defp value("M" = _), do: 1000
  defp value(_), do: 0

  defp is_valid?(string) do
    cond do
      # C, M and I may not be repeated more than thrice
      String.match?(string, ~r/[C]{4,}/) -> {:error, "Invalid syntax - Too many C repititions"}
      String.match?(string, ~r/[M]{4,}/) -> {:error, "Invalid syntax - Too many M repititions"}
      String.match?(string, ~r/[I]{4,}/) -> {:error, "Invalid syntax - Too many I repititions"}
      # V, L and D may never be repeated
      String.match?(string, ~r/[V]{2,}/) -> {:error, "Invalid syntax - Too many V repititions"}
      String.match?(string, ~r/[L]{2,}/) -> {:error, "Invalid syntax - Too many L repititions"}
      String.match?(string, ~r/[D]{2,}/) -> {:error, "Invalid syntax - Too many D repititions"}
      # I may not decrement C or M
      String.match?(string, ~r/IC/) -> {:error, "Invalid syntax - I may not decrement C"}
      String.match?(string, ~r/IM/) -> {:error, "Invalid syntax - I may not decrement M"}
      # V is never written to the left of X
      String.match?(string, ~r/VX/) -> {:error, "Invalid syntax - V may not decrement X"}
      true -> {:ok, string}
    end
  end
end