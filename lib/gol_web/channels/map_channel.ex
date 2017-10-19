defmodule GolWeb.MapChannel do
  use Phoenix.Channel

  def join("map", _message, socket) do
    send(self, :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    {:ok, pid} = Gol.start_link(%{map: @map, handle_tick: &push(socket, "tick", %{map: &1})})
    {:noreply, socket}
  end

end
