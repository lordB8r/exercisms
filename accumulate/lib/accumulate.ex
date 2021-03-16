defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate([], _),  do: []  # If a function is sent in, just respond w/ function
  def accumulate(list, fun) do    # Loop through each part of the list and use the function
    for x <- list do
      fun.(x)
    end
  end
end