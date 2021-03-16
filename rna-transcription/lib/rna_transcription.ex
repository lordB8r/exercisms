defmodule RnaTranscription do
  @mapToRNA %{?A=>?U, ?C=>?G, ?G=>?C, ?T=>?A}
 
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'

  G -> C
  C -> G
  T -> A
  A -> U
  """

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&@mapToRNA[&1])
    #_map = %{"G": "C", "C": "G", "T": "A", "A": "U"}
    #rnamap = %{"G" => "C", "C" => "G", "T" => "A", "A" => "U"}
    #dnachar = 'ACGTGGTCTTAA'
    #dnastr = to_string(dna)
    #dnalist = String.split(dnastr, "", trim: true)
    #l = for n <- dnalist, do: Map.get(rnamap, n)
    #rnastr = to_string(l)
    #rnachar = to_charlist(rnastr)
    #Enum.each(dnalist, fn(s) -> IO.puts(Map.get(rnamap, s)) end)
  end
end
