defmodule DNA do
  @map %{
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000,
    " " => 0b0000
  }

  def encode_nucleotide(code_point) do
    @map[code_point]
  end

  def decode_nucleotide(encoded_code) do
    Enum.find(@map, fn {_, value} -> value == encoded_code end) |> elem(0)
  end

  def encode(dna) do
    # Please implement the encode/1 function
  end

  def decode(dna) do
    # Please implement the decode/1 function
  end
end
