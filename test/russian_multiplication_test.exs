defmodule RussianMultiplicationTest do
  use ExUnit.Case, async: true

  test "47 * 42" do
    assert 1974 == KataRussianMultiplication.mul(47, 42)
  end

  test "100 * 100" do
    assert 10_000 == KataRussianMultiplication.mul(100, 100)
  end

  test "8 * 7" do
    assert 56 == KataRussianMultiplication.mul(8, 7)
  end
end
