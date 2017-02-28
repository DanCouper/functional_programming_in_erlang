defmodule MathExtendedAlgos do

  @doc """
  Returns the maximum number of pieces that a circle (though it applies
  to other regular-ish polygons) can be cut into using `n` straight lines.

      iex> MathExtendedAlgos.lazy_caterer(0)
      1

      iex> MathExtendedAlgos.lazy_caterer(7)
      29
  """
  def lazy_caterer(n) do
    1 + n + MathExtended.binomial(n, 2)
  end

  @doc """
  Returns the naximum number of pieces a three-dimansional cube (though it
  applies to other regular-shaped solids) can be cut into using `n` planes.
  An extension of the `lazy_caterer` to three dimensions.

      iex> MathExtendedAlgos.cake_number(0)
      1

      iex> MathExtendedAlgos.cake_number(4)
      15
  """
  def cake_number(n) do
    1 + n + MathExtended.binomial(n, 2) + MathExtended.binomial(n, 3)
  end
end
