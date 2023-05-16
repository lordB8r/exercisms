defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    value =
      Integer.to_string(color_value(Enum.at(colors, 0))) <>
        Integer.to_string(color_value(Enum.at(colors, 1)))

    size = resistance_size(Enum.at(colors, 2))

    size_value =
      String.trim(value <> size.zeros, "000")
      |> String.to_integer()

    {size_value, size.rating}
  end

  # 33 ohms
  defp color_value(:black), do: 0
  # 330 ohms
  defp color_value(:brown), do: 1
  # 3300 ohms
  defp color_value(:red), do: 2
  # 33 kiloohms
  defp color_value(:orange), do: 3
  # 330 kiloohms
  defp color_value(:yellow), do: 4
  # 3300 kiloohms
  defp color_value(:green), do: 5
  # 33 megaohms
  defp color_value(:blue), do: 6
  # 330 megaohms
  defp color_value(:violet), do: 7
  # 3300 megaohms
  defp color_value(:grey), do: 8
  # 33 gigaohms
  defp color_value(:white), do: 9

  defp resistance_size(color) do
    case color_value(color) do
      x when x in 0..1 -> %{zeros: number_of_zeroes(x), rating: :ohms}
      x when x in 2..4 -> %{zeros: number_of_zeroes(x), rating: :kiloohms}
      x when x in 5..8 -> %{zeros: number_of_zeroes(x), rating: :megaohms}
      _ -> %{zeros: "", rating: :gigaohms}
    end
  end

  defp number_of_zeroes(0), do: ""
  defp number_of_zeroes(1), do: "0"
  defp number_of_zeroes(2), do: "00"
  defp number_of_zeroes(3), do: ""
  defp number_of_zeroes(4), do: "0"
  defp number_of_zeroes(5), do: "00"
  defp number_of_zeroes(6), do: ""
  defp number_of_zeroes(7), do: "0"
  defp number_of_zeroes(8), do: "00"
end
