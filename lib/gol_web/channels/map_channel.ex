defmodule GolWeb.MapChannel do
  use Phoenix.Channel

  def join("map", _message, socket) do
    send(self, :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    spawn __MODULE__, :gol, [socket]
    {:noreply, socket}
  end

  @o false
  @x true
  @map [
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @x, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @x, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @x, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @x, @x, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @x, @x, @x, @o, @o, @o, @o, @o, @o, @x, @o, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @x, @x, @x, @o, @o, @o, @o, @o, @x, @x, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @x, @x, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @x, @x, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @x, @x, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @x, @o, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @x, @x, @x, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
    @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o, @o,
  ]
  def gol(socket, map \\ @map) do
    :timer.sleep(1000)
    push socket, "tick", %{map: map}
    gol(socket, Gol.next_tick(map))
  end
end
