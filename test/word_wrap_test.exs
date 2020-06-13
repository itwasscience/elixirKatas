defmodule WordWrapTest do
  use ExUnit.Case, async: true

  test "Wrapped to 9 lines" do
    input = "Es blaut die Nacht,
die Sternlein blinken,
Schneeflöcklein leis hernieder sinken."

    output = KataWordWrap.wrap(input)
    expected_result = "Es blaut
die
Nacht,
die
Sternlein
blinken,
Schneeflö
cklein
leis
hernieder
sinken."

    assert expected_result == output
  end

  test "Wrapped to 14 lines" do
    input = "Es blaut die Nacht,
die Sternlein blinken,
Schneeflöcklein leis hernieder sinken."

    output = KataWordWrap.wrap(input)
    expected_result = "Es blaut die
Nacht, die
Sternlein
blinken,
Schneeflöcklei
n leis
hernieder
sinken."

    assert expected_result == output
  end

  test "Wrapped to 22 lines with justification" do
    input = "Es blaut die Nacht,
die Sternlein blinken,
Schneeflöcklein leis hernieder sinken."

    output = KataWordWrap.wrap(input)
    expected_result = "Es  blaut  die  Nacht,
die Sternlein blinken,
Schneeflöcklein   leis
hernieder      sinken."

    assert expected_result == output
  end
end
