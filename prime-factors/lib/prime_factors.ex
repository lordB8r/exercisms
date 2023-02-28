defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []

  def factors_for(number) do
    factors_for(number, 2, [])
  end

  defp factors_for(number, lower_bound, primes) when lower_bound * lower_bound > number do
    Enum.reverse([number | primes])
  end

  defp factors_for(number, lower_bound, primes) when rem(number, lower_bound) == 0 do
    factors_for(div(number, lower_bound), lower_bound, [lower_bound | primes])
  end

  defp factors_for(number, lower_bound, primes) do
    factors_for(number, lower_bound+1, primes)
  end
end
