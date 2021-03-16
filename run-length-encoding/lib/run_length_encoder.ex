defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.scan(~r/(.)\1*/, string)
    |> Enum.map_join(&(string_encoder/1))
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.scan(~r/([0-9]*)(.)/, string, capture: :all_but_first)
    |> Enum.map_join(&(string_decoder/1))
  end

  defp string_encoder([str, letter]) do
    cond do
      String.length(str) > 1 -> "#{String.length(str)}#{letter}"  
      true -> "#{letter}"
    end
  end

  defp string_decoder([num, char]) do
    cond do
      String.length(num) == 0 -> char
      true -> char |> String.duplicate(num |> String.to_integer)
    end
  end
end
