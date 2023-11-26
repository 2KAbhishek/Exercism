defmodule TakeANumberDeluxe do
  use GenServer
  alias TakeANumberDeluxe.State

  # Client API
  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: State.t()
  def report_state(machine) do
    GenServer.call(machine, :report_state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(machine, :queue_new_number)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve_next_queued_number, priority_number})
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.cast(machine, :reset_state)
  end

  # private
  defp do_init([], %{min: min, max: max, timeout: timeout}) do
    case State.new(min, max, timeout) do
      {:ok, state} = ret ->
        send_timeout(state)
        ret

      {:error, v} ->
        {:stop, v}
    end
  end

  defp do_init([{:min_number, number} | rest], map), do: do_init(rest, %{map | min: number})

  defp do_init([{:max_number, number} | rest], map), do: do_init(rest, %{map | max: number})

  defp do_init([{:auto_shutdown_timeout, t} | rest], map), do: do_init(rest, %{map | timeout: t})

  defp send_timeout(%{auto_shutdown_timeout: timeout}) do
    if is_integer(timeout) and timeout > 0 do
      Process.send_after(self(), :timeout, timeout)
    end
  end

  # Server callbacks
  @impl true
  def init(init_arg) do
    do_init(init_arg, %{min: nil, max: nil, timeout: :infinity})
  end

  @impl true
  def handle_call(:report_state, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:queue_new_number, _from, state) do
    case State.queue_new_number(state) do
      {:ok, new_number, new_state} ->
        {:reply, {:ok, new_number}, new_state}

      {:error, error} ->
        {:reply, {:error, error}, state}
    end
  end

  def handle_call({:serve_next_queued_number, pri_number}, _from, state) do
    case State.serve_next_queued_number(state, pri_number) do
      {:ok, number, state} -> {:reply, {:ok, number}, state}
      error -> {:reply, error, state}
    end
  end

  @impl true
  def handle_cast(
        :reset_state,
        %{min_number: min, max_number: max, auto_shutdown_timeout: timeout}
      ) do
    case State.new(min, max, timeout) do
      {:ok, state} ->
        send_timeout(state)
        {:noreply, state}

      {:error, v} ->
        {:stop, v}
    end
  end

  @impl true
  def handle_info(:timeout, state) do
    {:stop, :normal, state}
  end

  def handle_info(_message, state) do
    {:noreply, state}
  end
end

