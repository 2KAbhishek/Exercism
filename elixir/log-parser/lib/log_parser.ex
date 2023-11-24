defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/\[DEBUG\]|\[INFO\]|\[WARN\]|\[ERROR\]/
  end

  def split_line(line) do
    String.split(line, ~r/\<[~\*=-]*\>/)
  end

  def remove_artifacts(line) do
    # Please implement the remove_artifacts/1 function
  end

  def tag_with_user_name(line) do
    # Please implement the tag_with_user_name/1 function
  end
end
