defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn item -> item.price end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(
      inventory,
      fn item -> %{item | name: String.replace(item.name, old_word, new_word)} end
    )
  end

  def increase_quantity(item, count) do
    Map.put(
      item,
      :quantity_by_size,
      Enum.map(item.quantity_by_size, fn {size, quantity} -> {size, quantity + count} end)
      |> Enum.into(%{})
    )
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, quantity}, acc -> acc + quantity end)
  end
end
