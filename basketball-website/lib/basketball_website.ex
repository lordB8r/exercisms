defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    keys = String.split(path, ".")
    use_key(data, keys)
  end

  defp use_key(nil, _), do: nil
  defp use_key(data, []), do: data
  defp use_key(data, _) when not is_map(data), do: nil
  defp use_key(data, [key | tail]) do
    use_key(data[key], tail)
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
