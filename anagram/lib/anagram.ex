defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, &anagrams?(base, &1))
  end

  defp anagrams?(base, candidate) do
    if String.downcase(base) == String.downcase(candidate), do: false, 
    else:
      alphabetize(base) == alphabetize(candidate)
  end

  defp alphabetize(word) do
    word
    |> String.downcase
    |> String.graphemes 
    |> Enum.sort    
  end
end
