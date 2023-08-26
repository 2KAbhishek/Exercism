defmodule KitchenCalculator do
  @ratios %{
    milliliter: 1,
    teaspoon: 5,
    tablespoon: 15,
    fluid_ounce: 30,
    cup: 240
  }

  def get_volume({_, value}), do: value

  def to_milliliter({unit, value}), do: {:milliliter, value * @ratios[unit]}

  def from_milliliter({:milliliter, value}, unit), do: {unit, value / @ratios[unit]}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
