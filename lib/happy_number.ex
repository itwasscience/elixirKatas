defmodule KataHappyNumber do
  def isHappy?(n) do
    {result, _} = calc(to_string(n), [])
    result
  end

  defp calc("1", _) do
    {true, 0}
  end

  defp calc(str, seen) do
    result =
      str
      |> String.graphemes()
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.reduce(0, fn x, acc -> acc + x * x end)
      |> to_string()

    if Enum.member?(seen, result) do
      {false, seen}
    else
      calc(result, seen ++ [result])
    end
  end
end
