defmodule Rot13Test do
  use ExUnit.Case, async: true

  test "Ensure english output is rotated with ROT13" do
    output = KataRot13.rotate("Hello, world")
    assert "URYTYB, JBEYQ" == output
  end

  test "Ensure english output is rotated with ROT13 back to normal" do
    output = KataRot13.rotate("URYTYB, JBEYQ")
    assert "HELLO, WORLD" == output
  end

  test "Ensure german with umlauts are replaced with double digits" do
    output = KataRot13.rotate("Ö, Ä, Ü, ß")
    assert "BR, NR, HR, FF" == output
  end
end
