defmodule Rot13Test do
  use ExUnit.Case, async: true

  test "Ensure english output is rotated with ROT13" do
    output = KataRot13.rotate("Hello, world", 13)
    assert "URYYB, JBEYQ" == output
  end

  test "Ensure english output is rotated with ROT13 back to normal" do
    output = KataRot13.rotate("URYYB, JBEYQ", 13)
    assert "HELLO, WORLD" == output
  end

  test "Ensure german with umlauts are replaced with double digits" do
    output = KataRot13.rotate("Ö, Ä, Ü, ß", 13)
    assert "BR, NR, HR, FF" == output
  end

  test "Ensure english output is rotated with ROT19" do
    output = KataRot13.rotate("Hello, world", 19)
    assert "AXEEH, PHKEW" == output
  end

  test "Ensure english output is rotated with ROT7 back to normal (from ROT19)" do
    output = KataRot13.rotate("AXEEH, PHKEW", 7)
    assert "HELLO, WORLD" == output
  end
end
