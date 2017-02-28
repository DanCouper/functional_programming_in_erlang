defmodule MathExtendedTest do
  use ExUnit.Case
  doctest MathExtended

  describe "factorialisation, exact and approximate" do
    test "factorialising 0 should always return 1" do
      assert MathExtended.factorial(0) == 1
    end

    test "factorialising 1 should always return 1" do
      assert MathExtended.factorial(1) == 1
    end

    test "factorialising > 1" do
      assert MathExtended.factorial(4) == 24
    end

    test "approximately factorialising" do
      assert_in_delta(MathExtended.factorial_approx(4), 24, 2)
    end
  end

  describe "binomial coefficient" do
    test "n choose 0 should always return 1" do
      assert MathExtended.binomial(10, 0) == 1
    end

    test "if n == k, there is only one distinct way n can be picked from k" do
      assert MathExtended.binomial(10, 10) == 1
    end

    test "5 choose 2" do
      assert MathExtended.binomial(5, 2) == 10
    end

    test "15 choose 11" do
      assert MathExtended.binomial(15, 11) == 1365
    end
  end


  describe "arrangement of planes" do
    test "cutting a pizza 0 times" do
      assert MathExtended.lazy_caterer(0) == 1
    end

    test "cutting a pizza 1 times" do
      assert MathExtended.lazy_caterer(1) == 2
    end

    test "cutting a pizza 4 times" do
      assert MathExtended.lazy_caterer(4) == 11
    end

    test "cutting a cake 0 times" do
      assert MathExtended.cake_number(0) == 1
    end

    test "cutting a cake 1 times" do
      assert MathExtended.cake_number(1) == 2
    end

    test "cutting a cake 4 times" do
      assert MathExtended.cake_number(4) == 15
    end
  end
end
