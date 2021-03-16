defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(str, len) when str == "" or len < 1, do: [] # send back empty list when empty string or negative size
  def slices(_s, _size) do
    len = String.length(_s)
    cond do
      len < _size -> [] # send back empty list when length of string is less than size
      true -> [String.slice(_s, 0, _size) | slices(String.slice(_s, 1, len-1), _size)]
    end
    
  end
end
