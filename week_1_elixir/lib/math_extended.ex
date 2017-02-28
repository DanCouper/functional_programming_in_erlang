defmodule MathExtended do
  @doc """
  Euler constant, approximation of.
  """
  def e do
    2.718281828459045
  end

  @doc """
  Exact factorialisation of number `n`. Always use `factorial_approx/1`
  if exact correctness is not required.

  OPTIMIZE this is an extremely naïve method

      iex> MathExtended.factorial(4)
      24
  """
  def factorial(n) do
    factorial(n, 1)
  end

  def factorial(0, acc) do
    acc
  end

  def factorial(n, acc) do
    factorial(n - 1, n * acc)
  end

  @doc """
  Stirling's method for finding approximate value of a factorial.
  See https://en.wikipedia.org/wiki/Stirling's_approximation

      iex> MathExtended.factorial_approx(4)
      23.506175132893294
  """
  def factorial_approx(n) do
    :math.sqrt(2 * :math.pi() * n) * :math.pow(n / e(), n)
  end


  @doc """
  The binomial coefficient returns an integer that specifies the number
  of ways `k` unordered outcomes can be picked from `n` possibilities.
  Note, this is _distinct_ possibilities, order is not taken into account.
  Written `n` over `k`, `n` choose `k`.

  For example, given a group of 15 footballers, there are
  11 possible places in the team (assuming we ignore ability to play in
  specific position)

      iex> MathExtended.binomial(15, 11)
      1365
  """
  def binomial(_, 0) do
    1
  end

  # The binomial function must handle impossible input of the form
  # `n` choose `k` when  `n` is less than `k` to allow binomials to
  # be used in calculations.
  def binomial(n, k) when n < k do
    0
  end

  def binomial(n, k) when is_integer(n) and is_integer(k) and n >= 0 and k >= 0 do
    binomial(n, k, 1, 1)
  end

  def binomial(n, k, k, acc) do
    div(acc * (n - k + 1), k)
  end

  def binomial(n, k, i, acc) do
    binomial(n, k, i + 1, div(acc * (n - i + 1), i))
  end
end
