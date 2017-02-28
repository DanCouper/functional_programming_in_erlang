defmodule MathExtendedAlgosTest do
  use ExUnit.Case
  doctest MathExtendedAlgos

  describe "arrangement of planes" do
    test "cutting a pizza 0 times" do
      assert MathExtendedAlgos.lazy_caterer(0) == 1
    end

    test "cutting a pizza 1 times" do
      assert MathExtendedAlgos.lazy_caterer(1) == 2
    end

    test "cutting a pizza 4 times" do
      assert MathExtendedAlgos.lazy_caterer(4) == 11
    end

    test "cutting a cake 0 times" do
      assert MathExtendedAlgos.cake_number(0) == 1
    end

    test "cutting a cake 1 times" do
      assert MathExtendedAlgos.cake_number(1) == 2
    end

    test "cutting a cake 4 times" do
      assert MathExtendedAlgos.cake_number(4) == 15
    end
  end
end
