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

  defp do_count([], acc, _) do
    acc
  end

  defp do_count([" " | tail], acc, "") do
    do_count(tail, acc, "")
  end

  defp do_count([" " | tail], acc, word) do
    do_count(tail, Map.put(acc, word, Map.get(acc, word, 0) + 1), "")
  end

  defp do_count(["_" | tail], acc, word) do
    do_count(tail, Map.put(acc, word, Map.get(acc, word, 0) + 1), "")
  end

  defp do_count([character | tail], acc, word) do
    if word_creating?(character) do
      do_count(tail, acc, word <> String.downcase(character))
    else
      do_count(tail, acc, word)
    end
  end

  defp word_creating?(character) do
    isLetter(character) || isDigit(character) || character == "-"
  end

  defp isDigit(s) do
    Enum.member?(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], s)
  end

  defp isLetter(s) do
    !(String.upcase(s) == String.downcase(s))
  end
end
