defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: foldl(l, 0, fn _, acc -> acc + 1 end)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, [], f)
  defp map([], acc, _f), do: reverse(acc)
  defp map([h | t], acc, f), do: map(t, [f.(h) | acc], f)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, [], f)
  defp filter([], acc, _f), do: reverse(acc)

  defp filter([h | t], acc, f) do
    if f.(h) do
      filter(t, [h | acc], f)
    else
      filter(t, acc, f)
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc
  def foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([], acc, _f), do: acc
  def foldr([h | t], acc, f), do: f.(h, foldr(t, acc, f))

  @spec append(list, list) :: list
  def append(l, []), do: l
  def append([], l), do: l
  def append([h | t], l), do: [h | append(t, l)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]), do: append(h, concat(t))
end
