defmodule BoutiqueSuggestions do
  @spec get_combinations(any, any, any) :: list
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = Keyword.get(options, :maximum_price, 100.0)

    for x <- tops,
        y <- bottoms,
        x.base_color != y.base_color,
        x.price + y.price < max_price do
      {x, y}
    end
  end
end
