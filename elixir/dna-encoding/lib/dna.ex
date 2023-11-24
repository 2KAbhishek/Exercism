defmodule DNA do
  @dna_map %{
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000,
    ?\s => 0b0000
  }

  def encode_nucleotide(code_point) do
    @dna_map[code_point]
  end

  def decode_nucleotide(encoded_code) do
    Enum.find(@dna_map, fn {_, value} -> value == encoded_code end) |> elem(0)
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
