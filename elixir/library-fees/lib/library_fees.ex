defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days_to_add = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime, days_to_add, :day))
  end

  def days_late(planned_return_date, actual_return_datetime) do
    max(0, Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date))
  end

  def monday?(datetime) do
    Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    returned_on = datetime_from_string(return)
    fee = rate * days_late(return_date(datetime_from_string(checkout)), returned_on)
    if monday?(returned_on), do: floor(fee / 2), else: fee
  end
end
