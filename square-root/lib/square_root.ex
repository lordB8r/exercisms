defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    get_radicand(radicand, 1)
  end

  defp get_radicand(x, y) do
    cond do
      y * y == x -> y
      true -> get_radicand(x, y + 1)
    end
  end
end
