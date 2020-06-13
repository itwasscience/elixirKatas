defmodule HappyNumberTest do
  use ExUnit.Case, async: true

  # https://en.wikipedia.org/wiki/Happy_number
  test "Valid happy numbers" do
    assert true == KataHappyNumber.isHappy?(1)
    assert false == KataHappyNumber.isHappy?(2)
    assert false == KataHappyNumber.isHappy?(3)
    assert false == KataHappyNumber.isHappy?(4)
    assert false == KataHappyNumber.isHappy?(5)
    assert false == KataHappyNumber.isHappy?(6)
    assert true == KataHappyNumber.isHappy?(7)
    assert false == KataHappyNumber.isHappy?(8)
    assert false == KataHappyNumber.isHappy?(9)
    assert true == KataHappyNumber.isHappy?(10)
    assert false == KataHappyNumber.isHappy?(11)
    assert false == KataHappyNumber.isHappy?(12)
    assert true == KataHappyNumber.isHappy?(13)
    assert false == KataHappyNumber.isHappy?(14)
    assert false == KataHappyNumber.isHappy?(15)
    assert false == KataHappyNumber.isHappy?(16)
    assert false == KataHappyNumber.isHappy?(17)
    assert false == KataHappyNumber.isHappy?(18)
    assert true == KataHappyNumber.isHappy?(19)
    assert false == KataHappyNumber.isHappy?(20)
    # Some big valid ones from wikipedia
    assert true == KataHappyNumber.isHappy?(964)
    assert true == KataHappyNumber.isHappy?(1000)
    # And some invalids
    assert false == KataHappyNumber.isHappy?(483)
    assert false == KataHappyNumber.isHappy?(999)
  end
end
