defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount / 100.0 * discount)
  end

  def monthly_rate(hourly_rate, discount) do
    amount = daily_rate(hourly_rate) * 22.0
    ceil(apply_discount(amount, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount),1)
  end
end
