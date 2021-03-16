defmodule WordCount do
  import String
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    # need to remove non-letter characters
    strlist = split(downcase(replace(sentence, ~r/[!#$%&()*+,.:;<=>?@\^_`{|}~]/, " ")))
    # downcase and split
    newmap = Enum.frequencies(strlist)
  end

  

end
