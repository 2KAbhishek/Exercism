defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(
      inventory,
      &%{&1 | name: String.replace(&1.name, old_word, new_word)}
    )
  end

  def increase_quantity(item, count) do
    new_quantity = Map.new(item.quantity_by_size, fn {k, v} -> {k, v + count} end)
    %{item | quantity_by_size: new_quantity}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, quantity}, acc -> acc + quantity end)
  end
end
