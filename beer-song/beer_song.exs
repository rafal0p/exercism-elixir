defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{String.capitalize(bottles(number))} of beer on the wall, #{bottles(number)} of beer.
    #{passing(number)}, #{bottles_after_passing(number)} of beer on the wall.
    """
  end

  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(number), do: "#{number} bottles"

  defp bottles_after_passing(number), do: bottles(Integer.mod(number - 1, 100))

  defp passing(0), do: "Go to the store and buy some more"
  defp passing(1), do: "Take it down and pass it around"
  defp passing(number), do: "Take one down and pass it around"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ (99..0)) do
    Enum.map(range, &verse/1)
    |> Enum.join("\n")
  end
end
