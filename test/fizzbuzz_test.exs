defmodule FizzbuzzTest do
  use ExUnit.Case, async: true

  test "Ensure output matches sample provided" do
    output = KataFizzbuzz.calculate(16)

    expected_result = "1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16"
    assert expected_result == output
    end
end
