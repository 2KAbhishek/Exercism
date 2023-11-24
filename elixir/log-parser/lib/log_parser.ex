defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/\[DEBUG\]|\[INFO\]|\[WARN\]|\[ERROR\]/
  end

  def split_line(line) do
    String.split(line, ~r/\<[~\*=-]*\>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line(\d+)/i, "")
  end

  def tag_with_user_name(line) do
    # Please implement the tag_with_user_name/1 function
    match = Regex.run(~r/User\s+(\S+)/, line)

    if match do
      "[USER] #{Enum.at(match, 1)} " <> line
    else
      line
    end
  end
end
