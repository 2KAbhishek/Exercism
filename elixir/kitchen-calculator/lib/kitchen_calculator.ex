defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:milliliter, value}), do: {:milliliter, value}
  def to_milliliter({:cup, value}), do: {:milliliter, value * 240}
  def to_milliliter({:fluid_ounce, value}), do: {:milliliter, value * 30}
  def to_milliliter({:teaspoon, value}), do: {:milliliter, value * 5}
  def to_milliliter({:tablespoon, value}), do: {:milliliter, value * 15}

  def from_milliliter({:milliliter, value}, :milliliter), do: {:milliliter, value}
  def from_milliliter({:milliliter, value}, :cup), do: {:cup, value / 240}
  def from_milliliter({:milliliter, value}, :fluid_ounce), do: {:fluid_ounce, value / 30}
  def from_milliliter({:milliliter, value}, :teaspoon), do: {:teaspoon, value / 5}
  def from_milliliter({:milliliter, value}, :tablespoon), do: {:tablespoon, value / 15}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
