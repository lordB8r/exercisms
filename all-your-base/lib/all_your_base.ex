defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}

  def convert(digits, input_base, output_base) do
    case Enum.all?(digits, fn num -> num >= 0 and num < input_base end) do
      true -> {:ok, digits |> to_decimal(input_base) |> to_output(output_base)}
      false -> {:error, "all digits must be >= 0 and < input base"}
    end
  end

  defp to_decimal(_num, base, _result \\ 0)
  defp to_decimal([], _, result), do: result

  defp to_decimal([num | rest] = digits, base, result) do
    result = result + num * round(:math.pow(base, length(digits) - 1))
    to_decimal(rest, base, result)
  end

  defp to_output(_num, _base, _result \\ [])
  defp to_output(num, base, result) when num < base, do: [num | result]

  defp to_output(num, base, result) do
    to_output(div(num, base), base, [rem(num, base) | result])
  end
end
