defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    do_count(String.graphemes(sentence <> " "))
  end

  defp do_count(_, acc \\ %{}, word \\ "")

  defp do_count([], acc, _), do: acc

  defp do_count([character | tail], acc, word) do
    case {character, word} do
      {" ", ""} ->
        do_count(tail, acc, "")
      {character, word} when character in [" ", "_"] ->
        do_count(tail, Map.update(acc, word, 1, &(&1 + 1)), "")
      {character, word} ->
        if word_creating?(character) do
          do_count(tail, acc, word <> String.downcase(character))
        else
          do_count(tail, acc, word)
        end
    end
  end

  defp word_creating?(character) do
    letter?(character) || digit?(character) || character == "-"
  end

  defp digit?(s) do
    Enum.member?(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], s)
  end

  defp letter?(s) do
    !(String.upcase(s) == String.downcase(s))
  end
end
