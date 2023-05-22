defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <= 0,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    divisor(number)
    |> Enum.reject(fn x -> x == number end)
    |> Enum.sum()
    |> case do
      x when x == number -> {:ok, :perfect}
      x when x < number -> {:ok, :deficient}
      x when x > number -> {:ok, :abundant}
    end
  end

  defp divisor(n), do: divisor(n, 1, []) |> Enum.sort()

  defp divisor(n, i, factors) when n < i * i, do: factors
  defp divisor(n, i, factors) when n == i * i, do: [i | factors]
  defp divisor(n, i, factors) when rem(n, i) == 0, do: divisor(n, i + 1, [i, div(n, i) | factors])
  defp divisor(n, i, factors), do: divisor(n, i + 1, factors)
end
