defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    %{input: input, pid: spawn_link(fn -> calculator.(input) end)}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    receive do
      {:EXIT, ^pid, :normal} -> Map.put(results, input, :ok)
      {:EXIT, ^pid, _reason} -> Map.put(results, input, :error)
    after
      100 -> Map.put(results, input, :timeout)
    end
  end

  def reliability_check(calculator, inputs) do
    state = Process.flag(:trap_exit, true)

    stream =
      inputs
      |> Task.async_stream(
        fn input ->
          state = Process.flag(:trap_exit, true)

          result =
            start_reliability_check(calculator, input) |> await_reliability_check_result(%{})

          Process.flag(:trap_exit, state)
          result
        end,
        max_concurrency: 100
      )

    result =
      stream
      |> Enum.reduce(%{}, fn {:ok, body}, acc ->
        Enum.into(acc, body)
      end)

    Process.flag(:trap_exit, state)
    result
  end

  def correctness_check(calculator, inputs) do
    # Please implement the correctness_check/2 function
  end
end
