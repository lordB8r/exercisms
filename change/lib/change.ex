defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(_coins, 0), do: {:ok, []}

  def generate(coins, target) do
    case make_all_change_combos(Enum.sort(coins, :desc), target) do
      [] -> {:error, "cannot change"}
      change -> {:ok, change |> Enum.min_by(&Enum.count/1)}
    end
  end

  defp make_all_change_combos([], _), do: []

  defp make_all_change_combos([_ | t] = coins, target) do
    case make_change(coins, target, []) do
      {:ok, change} -> [change | make_all_change_combos(t, target)]
      _ -> make_all_change_combos(t, target)
    end
  end

  defp make_change(_coins, 0, result), do: {:ok, result}
  defp make_change([], _, _), do: :error

  defp make_change([coin | coins], target, result) when target >= coin do
    case make_change([coin | coins], target - coin, [coin | result]) do
      :error -> make_change(coins, target, result)
      change -> change
    end
  end

  defp make_change([_coin | coins], target, result), do: make_change(coins, target, result)
end
