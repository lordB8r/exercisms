defmodule RomanNumerals do
  # @mapRomanNumerals %{?I=>1, ?V=>5, ?X=>10, ?L=>50, ?C=>100, ?D=>500, ?M=>1000}
  @mapNumeralsRoman  [{"I", 1}, 
                      {"IV", 4}, 
                      {"V", 5}, 
                      {"IX", 9}, 
                      {"X",10}, 
                      {"XL", 40 }, 
                      {"L",50}, 
                      {"XC",90}, 
                      {"C",100}, 
                      {"CD",400}, 
                      {"D",500}, 
                      {"CM",900}, 
                      {"M",1000}]
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(0), do: ""

  def numeral(number) do
    List.duplicate("I", number)
    |> Enum.join
    |> String.replace(~r/I{1000}/, "M")
    |> String.replace(~r/I{900}/, "CM")
    |> String.replace(~r/I{500}/, "D")
    |> String.replace(~r/I{400}/, "CD")
    |> String.replace(~r/I{100}/, "C")
    |> String.replace(~r/I{90}/, "XC")
    |> String.replace(~r/I{50}/, "L")
    |> String.replace(~r/I{40}/, "XL")
    |> String.replace(~r/I{10}/, "X")
    |> String.replace(~r/I{9}/, "IX")
    |> String.replace(~r/I{5}/, "V")
    |> String.replace(~r/I{4}/, "IV")
  end

end
