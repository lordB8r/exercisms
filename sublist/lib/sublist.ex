defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal         # in case both lists are identical
  def compare(a, b) do
    cond do
      is_sublist?(a, b) -> :sublist     # if a is part of b, sublist
      is_sublist?(b, a) -> :superlist   # if b is part of a, superlist
      true              -> :unequal     # if neither, the lists are unequal
    end
  end

  # recursive check 
  defp is_sublist?(_,[]), do: false
  defp is_sublist?(a, b = [_ | b_tail]) do
    matches?(a, b) || is_sublist?(a,b_tail)
  end

  # quick evaluation to see if the heads match
  defp matches?([], _), do: true        # head is list
  # we know heads match, let's try tails, splits list into head | tail to recursively check 
  defp matches?([matching_value | a], [matching_value | b]) do
    matches?(a, b)
  end
  defp matches?(_,_), do: false

end
