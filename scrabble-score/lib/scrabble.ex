defmodule Scrabble do
  @point %{
    1  => ~c(AEIOULNRST),
    2  => ~c(DG),
    3  => ~c(BCMP),
    4  => ~c(FHVWY),
    5  => ~c(K),
    8  => ~c(JX),
    10 => ~c(QZ)
  }

  @scoring for {p, chars} <- @point,
                        c <- chars,
                        into: %{},
                        do: {c, p}
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) when word == "", do: 0
  def score(word) do
    word
    |> String.replace(~r/[\s\t\n ]/,"")
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.map(&(@scoring[&1] || 0))
    |> Enum.sum
  end
end
