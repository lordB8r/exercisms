defmodule Bob do
  @doc """
  Responses to questions

  Examples
  iex> Bob.hey("Tom-ay-to, tom-aaaah-to.")
  "Whatever."

  iex> Bob.hey("Does this cryogenic chamber make me look fat?")
  "Sure."

  iex> Bob.hey("WATCH OUT!")
  "Whoa, chill out!"
  
  iex> Bob.hey("WHAT'S GOING ON?")
  "Calm down, I know what I'm doing!"

  iex> Bob.hey("")
  "Fine. Be that way!"

  iex> Bob.hey("Hi there!")
  "Whatever."

  """
  def hey(input) do
    cond do
      is_silent?(input) -> "Fine. Be that way!"
      is_shouting?(input) && is_question?(input) -> "Calm down, I know what I'm doing!"
      is_question?(input) -> "Sure."
      is_shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_silent?(input) do is_empty?(input) end

  defp is_question?(input) do String.ends_with?(String.strip(input), "?") end

  defp is_shouting?(input) do has_letters?(input) && is_all_caps?(input) end

  defp is_all_caps?(input) do String.upcase(input)==input end 

  defp has_letters?(input) do Regex.match?(~r/[\p{L}]/, input) end

  defp is_empty?(input) do length(String.split(input,~r/[  \t\r\n\v\f]/,trim: true))==0 end
end
