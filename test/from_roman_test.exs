defmodule FromRomanTest do
  use ExUnit.Case, async: true

  test "Roman numerals are calcauted from provided samples" do
    assert {:ok, "1"} == FromRomanTest.parse("I")
    assert {:ok, "2"} == FromRomanTest.parse("II")
    assert {:ok, "4"} == FromRomanTest.parse("IV")
    assert {:ok, "5"} == FromRomanTest.parse("IV")
    assert {:ok, "9"} == FromRomanTest.parse("IX")
    assert {:ok, "42"} == FromRomanTest.parse("XLII")
    assert {:ok, "99"} == FromRomanTest.parse("XCIX")
    assert {:ok, "2003"} == FromRomanTest.parse("MMXIII")
  end

  test "Semantic error for IC is caught" do
    assert {:error, "Invalid syntax"} == FromRomanTest.parse("IC")
  end

  test "Semantic error for IM is caught" do
    assert {:error, "Invalid syntax"} == FromRomanTest.parse("IM")
  end
end
