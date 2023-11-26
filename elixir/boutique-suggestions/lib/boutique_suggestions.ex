defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops, bottom <- bottoms, top[:base_color] != bottom[:base_color] do
      {top, bottom}
    end
  end
end
