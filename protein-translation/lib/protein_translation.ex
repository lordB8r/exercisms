defmodule ProteinTranslation do
  # Make a map of all the codons
  @codons %{  
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"}
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    # split the string based on every 3 letters, using a regex for just the 4 potential letters
    String.split(rna, ~r/[UGCA]{3}/, include_captures: true, trim: true)
    |> of_rna([]) # private function to handle the list

  end

  defp of_rna([], acc), do: {:ok, acc}  # if empty or done, return accumulated string

  defp of_rna([head | tail], acc) do
    case of_codon(head) do
      {_, "STOP"}     -> {:ok, acc}                     # If we've hit the end, return string
      {:error, _}     -> {:error, "invalid RNA"}        # Bad coding, return error
      {:ok, protein}  -> of_rna(tail, acc ++ [protein]) # Keep diving deepers
    end
  end

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    codon = Map.fetch(@codons, codon)       # Using codon as key for value in map above
    case codon do
      :error -> {:error, "invalid codon"}   # If it's not in the map, error, maybe could try Enum.has
      _ -> codon                            # Return the Codon map value
    end
  end
end
