defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(dot, frame_number, opts) :: {dot}

  defmacro __using__(_opts \\ []) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  def handle_frame(dot, frame_number, _opts) do
    if rem(frame_number, 4) == 0 do
      %DancingDots.Dot{dot | opacity: dot.opacity / 2}
    else
      dot
    end
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  def init([velocity: v] = opts) when is_integer(v), do: {:ok, opts}
end
