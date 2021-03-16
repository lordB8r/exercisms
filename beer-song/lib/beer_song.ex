defmodule BeerSong do
  @doc """
  Get a single verse of the beer song

  iex> BeerSong.verse(99)
  "99 bottles of beer on the wall, 99 bottles of beer.
  Take one down and pass it around, 98 bottles of beer on the wall."
    
  Get a range of verses of the beer song        
  iex> BeerSong.lyrics(99..98)
  "99 bottles of beer on the wall, 99 bottles of beer.
  Take one down and pass it around, 98 bottles of beer on the wall."

  "98 bottles of beer on the wall, 98 bottles of beer.
  Take one down and pass it around, 97 bottles of beer on the wall."

  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    cond do
      is_last_verse?(number) -> 
        "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
      is_second_to_last_verse?(number) ->
        "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"  
      is_third_to_last_verse?(number) ->
        "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"  
      true -> "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number-1} bottles of beer on the wall.\n"
    end

  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &BeerSong.verse/1)
  end


  defp is_last_verse?(number) do number == 0 end
  defp is_second_to_last_verse?(number) do number == 1 end
  defp is_third_to_last_verse?(number) do number == 2 end
end
