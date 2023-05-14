defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(elapsed_minutes), do: expected_minutes_in_oven - elapsed_minutes

  def preparation_time_in_minutes(layers), do: layers * 2

  def total_time_in_minutes(layers, elapsed_minutes) do
    preparation_time_in_minutes(layers) + elapsed_minutes
  end

  def alarm, do: "Ding!"
end
