# https://ccd-school.de/coding-dojo/function-katas/csv-tabellieren/
# 
# Uses source.csv as input
#
# Expected Result:
#
# Name         |Strasse         |Ort          |Alter|
# -------------+----------------+-------------+-----+
# Peter Pan    |Am Hang 5       |12345 Einsam |42   |
# Maria Schmitz|Kölner Straße 45|50123 Köln   |43   |
# Paul Meier   |Münchener Weg 1 |87654 München|65   |

defmodule Matrix do
  # Transposition code
  # http://stackoverflow.com/questions/5389254/transposing-a-2-dimensional-matrix-in-erlang
  # https://gist.github.com/pmarreck/6e054c162844e9d83d89
  def transpose([[x | xs] | xss]) do
    [[x | for([h | _] <- xss, do: h)] | transpose([xs | for([_ | t] <- xss, do: t)])]
  end

  def transpose([[] | xss]), do: transpose(xss)

  def transpose([]), do: []
end

defmodule CSVKata do
  defp read_CSV(filename) do
    File.stream!(filename)
    |> Stream.map(&String.trim(&1))
    |> Stream.map(&String.split(&1, ";"))
  end

  defp print_line(line, spacing) do
    line
    |> Enum.with_index()
    |> Enum.each(fn x -> print_cell(elem(x, 0), Enum.at(spacing, elem(x, 1))) end)

    IO.puts("")
  end

  defp print_header_break(column_widths) do
    column_widths
    |> Enum.each(fn x -> IO.write(String.pad_trailing("", x + 1, "-") <> "+") end)

    IO.puts("")
  end

  defp print_cell(line, pad_length) do
    IO.write(String.pad_trailing(line, pad_length + 1) <> "|")
  end

  defp calc_max_widths(stream) do
    stream
    |> Enum.to_list()
    # Turn rows into columns and vice-versa
    |> Matrix.transpose()
    # Sort row values by length
    |> Enum.map(fn x -> Enum.sort(x, &(String.length(&1) >= String.length(&2))) end)
    # Calculate length
    |> Enum.map(fn x -> List.first(x) |> String.length() end)
  end

  defp split_header_body(stream) do
    {Enum.at(stream, 0), Stream.drop(stream, 1)}
  end

  def print_CSV(filename) do
    column_widths = read_CSV(filename) |> calc_max_widths()

    {header, body} = read_CSV(filename) |> split_header_body()

    header |> print_line(column_widths)
    print_header_break(column_widths)

    body
    |> Enum.to_list()
    |> Enum.each(fn x -> print_line(x, column_widths) end)
  end
end

CSVKata.print_CSV("tabulateCSV.csv")
