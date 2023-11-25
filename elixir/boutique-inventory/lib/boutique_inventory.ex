defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn item -> item.price end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    # Please implement the update_names/3 function
  end

  def increase_quantity(item, count) do
    # Please implement the increase_quantity/2 function
  end

  def total_quantity(item) do
    # Please implement the total_quantity/1 function
  end
end
