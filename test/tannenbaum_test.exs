defmodule TannenbaumTest do
  use ExUnit.Case, async: true

  test "Small tree" do
    output = KataTannenbaum.tree(3)
    expectedResult = "
  X
 XXX
XXXXX
  I
"
    assert expectedResult == output
  end

  test "Big tree" do
    output = KataTannenbaum.tree(6)
    expectedResult = "
     X
    XXX
   XXXXX
  XXXXXXX
 XXXXXXXXX
XXXXXXXXXXX
     I
"
    assert expectedResult == output
  end

  test "Big tree with star variation" do
    output = KataTannenbaum.tree_with_star(6)
    expectedResult = "
     🟍
     X
    XXX
   XXXXX
  XXXXXXX
 XXXXXXXXX
XXXXXXXXXXX
     I
"
    assert expectedResult == output
  end
end
