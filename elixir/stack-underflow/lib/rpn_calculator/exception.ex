defmodule RPNCalculator.Exception do
  # Please implement DivisionByZeroError here.
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  # Please implement StackUnderflowError here.
  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    def exception(context) do
      case context do
        [] -> %__MODULE__{}
        context -> %__MODULE__{message: "stack underflow occurred, context: #{context}"}
      end
    end
  end
end
