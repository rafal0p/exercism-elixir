defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    length(Enum.filter(strand, &(nucleotide == &1)))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram([], acc) do
    acc
  end

  def histogram(
        [nucleotide | strand],
        acc \\ %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
      ) do
    histogram(
      strand,
      Map.put(acc, nucleotide, acc[nucleotide] + 1)
    )
  end

end
