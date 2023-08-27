defmodule Username do
  def sanitize(~c""), do: ~c""

  def sanitize([head | tail]) do
    sanitized =
      case head do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        char when char in ?a..?z -> [char]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    sanitized ++ sanitize(tail)
  end
end
