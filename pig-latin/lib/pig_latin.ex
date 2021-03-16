defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase                              # phrase
    |> String.split(" ")                # break up > 1 word
    |> Enum.map(&String.graphemes(&1))  # split into graphemes
    |> Enum.map(&piggify(&1))           # piggify each word grapheme
    |> Enum.join(" ")                   # put it back together
  end

  # if the first two letters of the grapheme list are "qu", append to the tail
  defp piggify(["q", "u" | tail]), do: tail ++["quay"]

  # if the first letter is "y" and the next letter is not a vowel, add
  defp piggify(["y", x | _] = word)
    when x not in ~w(a e i o u) do
      word ++ ["ay"]
    end

  defp piggify(["x", y | _] = word)
    when y not in ~w(a e i o u) do
      word ++ ["ay"]
    end

  defp piggify([h | _] = word)
    when h in ~w(a e i o u) do
      word ++ ["ay"]
    end

  defp piggify([h | t]) do
    piggify(t ++ [h])
  end

end
