defmodule FromRomanTest do
  use ExUnit.Case, async: true

  test "Roman numerals are calcauted from provided samples" do
    assert {:ok, "1"} == KataFromRoman.parse("I")
    assert {:ok, "2"} == KataFromRoman.parse("II")
    assert {:ok, "4"} == KataFromRoman.parse("IV")
    assert {:ok, "5"} == KataFromRoman.parse("V")
    assert {:ok, "9"} == KataFromRoman.parse("IX")
    assert {:ok, "42"} == KataFromRoman.parse("XLII")
    assert {:ok, "99"} == KataFromRoman.parse("XCIX")
    assert {:ok, "2013"} == KataFromRoman.parse("MMXIII")
    assert {:ok, "1967"} == KataFromRoman.parse("MCMLXVII")
  end

  test "C M and I may never be repeated more than thrice" do
    assert {:error, "Invalid syntax - Too many C repititions"} == KataFromRoman.parse("MCCCCIV")
    assert {:error, "Invalid syntax - Too many M repititions"} == KataFromRoman.parse("MMMMVII")
    assert {:error, "Invalid syntax - Too many I repititions"} == KataFromRoman.parse("CIIII")
  end

  test "V L and D may never be repeated" do
    assert {:error, "Invalid syntax - Too many V repititions"} == KataFromRoman.parse("MCCVVIII")
    assert {:error, "Invalid syntax - Too many D repititions"} == KataFromRoman.parse("CDDIII")
    assert {:error, "Invalid syntax - Too many L repititions"} == KataFromRoman.parse("CLLII")
  end

  test "I may not decrement C or M" do
    assert {:error, "Invalid syntax - I may not decrement C"} == KataFromRoman.parse("MIC")
    assert {:error, "Invalid syntax - I may not decrement M"} == KataFromRoman.parse("MMIM")
  end

  test "V may not decrementX" do
    assert {:error, "Invalid syntax - V may not decrement X"} == KataFromRoman.parse("VXIII")
  end

end
