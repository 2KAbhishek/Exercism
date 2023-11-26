defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts :: opts) :: {:ok, opts :: opts} | {:error, error :: error}
  @callback handle_frame(dot :: dot, frame_number :: frame_number, opts :: opts) :: {dot :: dot}

  defmacro __using__(_opts \\ []) do
    quote do
      def init(opts), do: {:ok, opts}
    end
  end
end

defmodule DancingDots.Flicker do
  # Please implement the module
end

defmodule DancingDots.Zoom do
  # Please implement the module
end
