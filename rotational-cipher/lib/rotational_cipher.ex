defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_charlist(text)     
    |> Enum.map(&combine(&1, shift))
    |> to_string
  end

  defp combine(x, shift) do 
    cond do
      97<=x && x<=122 -> rem(x - ?a + shift, 26) + ?a #a==97..z==122    
      65<=x && x<=90 -> rem(x - ?A + shift, 26) + ?A  #A==65..Z==90
      true -> x 
    end
  end
end 
