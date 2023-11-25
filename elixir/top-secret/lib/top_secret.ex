defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({op, _, rest} = ast, acc) when op in [:def, :defp], do: {ast, [do_decode(rest) | acc]}
  def decode_secret_message_part(ast, acc), do: {ast,acc}

  defp do_decode([{:when, _, rest}|_]), do: do_decode(rest)
  defp do_decode([{_, _, nil}|_]), do: ""
  defp do_decode([{fun, _, args}|_]), do: String.slice(Kernel.to_string(fun), 0, length(args))

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end
