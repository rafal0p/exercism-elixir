defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    case number do
      n when n >= 1000 -> "M" <> numerals(n - 1000)
      n when n >= 900 -> "CM" <> numerals(n - 900)
      n when n >= 500 -> "D" <> numerals(n - 500)
      n when n >= 400 -> "CD" <> numerals(n - 400)
      n when n >= 100 -> "C" <> numerals(n - 100)
      n when n >= 90 -> "XC" <> numerals(n - 90)
      n when n >= 50 -> "L" <> numerals(n - 50)
      n when n >= 40 -> "XL" <> numerals(n - 40)
      n when n >= 10 -> "X" <> numerals(n - 10)
      n when n >= 9 -> "IX" <> numerals(n - 9)
      n when n >= 5 -> "V" <> numerals(n - 5)
      n when n >= 4 -> "IV" <> numerals(n - 4)
      n when n >= 1 -> "I" <> numerals(n - 1)
      0 -> ""
    end
  end
end
