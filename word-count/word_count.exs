defmodule Words do
  @chars_except_aplhanumeric_and_dash ~r/[^[:alnum:]-]/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(@chars_except_aplhanumeric_and_dash, trim: true)
    |> Enum.reduce(
         %{},
         fn word, acc -> Map.update(acc, word, 1, &(&1 + 1)) end
       )
  end

end
