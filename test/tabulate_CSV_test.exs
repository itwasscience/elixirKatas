defmodule TabulateCSVTest do
  use ExUnit.Case, async: true

  test "Ensure output matches sample provided" do
    output = KataCSVTabuluate.print_CSV("tabulateCSV.csv")

    expected_result = "Name         |Strasse         |Ort          |Alter|
-------------+----------------+-------------+-----+
Peter Pan    |Am Hang 5       |12345 Einsam |42   |
Maria Schmitz|Kölner Straße 45|50123 Köln   |43   |
Paul Meier   |Münchener Weg 1 |87654 München|65   |
"
    assert expected_result == output
  end

  test "Ensure invalid result is invalid" do
    output = KataCSVTabuluate.print_CSV("tabulateCSV.csv")
    invalid_result = "FIZZBUZZ BAD DATA"

    refute invalid_result == output
  end
end