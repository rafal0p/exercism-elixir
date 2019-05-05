defmodule Bob do
  def hey(input) do
    cond do
      shout?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      shout?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      silence?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp shout?(input) do
    String.upcase(input) == input && at_least_one_letter(input)
  end

  defp at_least_one_letter(input) do
    String.match?(input, ~r/\p{L}+/u)
  end

  defp question?(input) do
    String.last(input) == "?"
  end

  defp silence?(input) do
    String.trim(input) == ""
  end
end
