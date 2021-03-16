defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  
  def keep([], _fun), do: []            # Basic setup of the  

  def keep([head | tail], fun) do       # Use head/tail to evaluate, then loop
    case fun.(head) do                  # Apply the function
      true -> [head | keep(tail, fun)]  # If true, keep, and work on tail
      false -> keep(tail, fun)          # If false, skip the head and recursive on tail
    end
  end 


  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    keep(list, &(!fun.(&1)))            # Using the ! provides the opposite function, so instead of keeping, we'd discard, and instead of discarding, we'd keep!
  end
end
