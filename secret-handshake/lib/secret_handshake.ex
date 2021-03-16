defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    
    Integer.digits(code, 2)       # generates the binary representation of the digit, i.e. 2 = 10
    |> Enum.reverse               # reverses it, i.e. 2 = 01
    |> Enum.with_index            # for each binary number, adds an index to it, i.e. 2 = [{0,1}, {1,0}] * remember it's reversed!
    |> Enum.reduce([], &secret/2) # run one of the pattern matching algos
    |> Enum.reverse               # put it back in order
  end  

  # Pattern matching:
  defp secret({0,_}, acc), do: acc                      # if the bit is 0, nothing
  defp secret({_,0}, acc), do: ["wink"|acc]             # if the bit is 1
  defp secret({_,1}, acc), do: ["double blink"|acc]     # if the bit is 2
  defp secret({_,2}, acc), do: ["close your eyes"|acc]  # if the bit is 4
  defp secret({_,3}, acc), do: ["jump"|acc]             # if the bit is 8
  defp secret({_,4}, acc), do: Enum.reverse(acc)        # if the bit is 16
  defp secret({_,_}, acc), do: acc                      # if the bit is > 31
end
