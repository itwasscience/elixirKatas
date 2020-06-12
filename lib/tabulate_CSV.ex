# https://ccd-school.de/coding-dojo/function-katas/csv-tabellieren/
# 
# Uses source.csv as input

defmodule KataMatrix do
  # Transposition code
  # http://stackoverflow.com/questions/5389254/transposing-a-2-dimensional-matrix-in-erlang
  # https://gist.github.com/pmarreck/6e054c162844e9d83d89
  def transpose([[x | xs] | xss]) do
    [[x | for([h | _] <- xss, do: h)] | transpose([xs | for([_ | t] <- xss, do: t)])]
  end

  def transpose([[] | xss]), do: transpose(xss)

  def transpose([]), do: []
end

defmodule KataCSVTabuluate do
  defp read_CSV(filename) do
    File.stream!(filename)
    |> Stream.map(&String.trim(&1))
    |> Stream.map(&String.split(&1, ";"))
  end

  defp print_line(line_list, spacing) do
    line_list
    |> Enum.with_index()
    |> Enum.map(fn x -> print_cell(elem(x, 0), Enum.at(spacing, elem(x, 1))) end)
    |> Enum.join()
  end

  defp print_header(header_list, column_widths) do
    header_string = print_line(header_list, column_widths)

    break_string =
      column_widths
      |> Enum.map(fn x -> String.pad_trailing("", x, "-") <> "+" end)
      |> Enum.join()

    header_string <> "\n" <> break_string <> "\n"
  end

  defp print_cell(value, pad_length) do
    String.pad_trailing(value, pad_length) <> "|"
  end

  defp calc_max_widths(stream) do
    stream
    |> Enum.to_list()
    # Turn rows into columns and vice-versa
    |> KataMatrix.transpose()
    # Sort row values by length
    |> Enum.map(fn x -> Enum.sort(x, &(String.length(&1) >= String.length(&2))) end)
    # Calculate length
    |> Enum.map(fn x -> List.first(x) |> String.length() end)
  end

  defp split_header_body(stream) do
    {Enum.at(stream, 0), Stream.drop(stream, 1)}
  end

  defp print_body(input, column_widths) do
    input
    |> Enum.to_list()
    |> Enum.map(fn x -> print_line(x, column_widths) <> "\n" end)
    |> Enum.join()
  end

  def print_CSV(filename) do
    column_widths = read_CSV(filename) |> calc_max_widths()

    {header, body} = read_CSV(filename) |> split_header_body()

    print_header(header, column_widths) <> print_body(body, column_widths)
  end
end
