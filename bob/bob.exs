defmodule Bob do
  @doc """
  Responds to different types of phrases

  ## Examples

    iex> Teenager.hey("Tom-ay-to, tom-aaaah-to.")
    "Whatever."

    iex> Teenager.hey("WATCH OUT!")
    "Woah, chill out!"

    iex> Teenager.hey("Does this cryogenic chamber make me look fat?")
    "Sure."

    iex> Teenager.hey("")
    "Fine. Be that way!"

  """
  def hey(phrase) do
    cond do
      silence?(phrase) ->
        "Fine. Be that way!"
      shout?(phrase) ->
        "Woah, chill out!"
      question?(phrase) ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  defp silence?(phrase), do: String.strip(phrase) == ""
  defp shout?(phrase), do: String.upcase(phrase) == phrase 
  defp question?(phrase), do: String.last(phrase) == "?"
end
