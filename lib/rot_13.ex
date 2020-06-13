defmodule KataRot13 do
  def rotate(string, shift) do
    string
    |> String.upcase()
    |> String.replace("Ö", "OE")
    |> String.replace("Ä", "AE")
    |> String.replace("Ü", "UE")
    |> String.replace("ß", "SS")
    |> String.graphemes()
    |> Enum.map(fn x -> caeser(x, shift) end)
    |> Enum.join()
  end

  def caeser(str, shift) do
    letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    offset =
      letters
      |> String.graphemes()
      |> Enum.find_index(&(&1 == str))

    if is_number(offset) do
      i = if offset + shift >= 26, do: shift + offset - 26, else: offset + shift
      String.slice(letters, i, 1)
    else
      str
    end
  end
end
