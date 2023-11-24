defmodule DNA do
  def encode_nucleotide(code_point) do
    dna_binary = %{
      ?A => 0b0001,
      ?C => 0b0010,
      ?G => 0b0100,
      ?T => 0b1000,
      ?\s => 0b0000
    }

    dna_binary[code_point]
  end

  def decode_nucleotide(encoded_code) do
    binary_dna = %{
      0b0001 => ?A,
      0b0010 => ?C,
      0b0100 => ?G,
      0b1000 => ?T,
      0b0000 => ?\s
    }

    binary_dna[encoded_code]
  end

  def encode(dna), do: do_encode(dna, <<>>)
  defp do_encode([], acc), do: acc

  defp do_encode([head | tail], acc) do
    do_encode(tail, <<acc::bitstring, encode_nucleotide(head)::size(4)>>)
  end

  def decode(dna), do: do_decode(dna, ~c"")
  defp do_decode(<<>>, acc), do: acc

  defp do_decode(<<head::size(4), tail::bitstring>>, acc) do
    do_decode(tail, acc ++ [decode_nucleotide(head)])
  end
end
