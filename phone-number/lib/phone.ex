defmodule Phone do
  @wrong_number "0000000000"

  @spec number(String.t()) :: String.t()
  def number(raw) do
    case Regex.match?(~r/[A-Za-z]/, raw) do
      true -> @wrong_number
      _ ->  Regex.replace(~r(\D), raw, "")
            |> number_fix
    end
  end

  defp number_fix("0" <> _), do: @wrong_number
  defp number_fix("1" <> tail), do: if String.length(tail)==10, do: number_fix(tail), else: @wrong_number
  defp number_fix(number) do 
    case String.length(number) do
      10 -> if String.at(number, 3) not in ["0","1"], do: number, else: @wrong_number
      _ -> @wrong_number
    end
  end

  @spec area_code(String.t()) :: String.t()
  def area_code(raw) do
    <<area_code::binary-3>> <> _num = number(raw)
    area_code
  end

  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    <<area_code::binary-3>> <> <<first::binary-3>> <> <<last::binary-4>> 
      = number(raw)
    "(#{area_code}) #{first}-#{last}" 
  end
end
