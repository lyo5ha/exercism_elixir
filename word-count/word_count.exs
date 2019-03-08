defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> list_of_words
    |> grouping
    |> formating
  end

  defp list_of_words(sentence) do
    String.downcase(sentence) |> String.split(~r/[^\p{L}\p{N}-]/u, trim: true)
  end

  defp grouping(list), do: Enum.group_by(list, &(&1), &(&1))

  defp formating(map), do: Enum.reduce(map, %{}, &counting/2)

  defp counting({key, value}, accum), do: Map.put(accum, key, Enum.count(value))
end
