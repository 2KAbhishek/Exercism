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
  def init(_opts), do: {:ok, []}

  def handle_frame(dot, frame_number, _opts) do
    if rem(frame_number, 4) == 0 do
      dot.opacity / 2
    else
      dot
    end
  end
end

defmodule DancingDots.Zoom do
  # Please implement the module
end
