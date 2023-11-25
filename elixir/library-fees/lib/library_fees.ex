defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime, 28, :day))
    else
      NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime, 29, :day))
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    max(0, diff)
  end

  def monday?(datetime) do
    # Please implement the monday?/1 function
  end

  def calculate_late_fee(checkout, return, rate) do
    # Please implement the calculate_late_fee/3 function
  end
end
