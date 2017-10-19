defmodule Gol.CLI do
 
  def run do
    {:ok, pid} = Gol.start_link(%{handle_tick: &handle_tick(&1)})
    ref = Process.monitor(pid)

    receive do
      {:DOWN, ^ref, _, _, _} -> IO.puts "done"
    end
  end

  def handle_tick(map) do
    width = map |> Enum.count |> :math.sqrt |> round
    IO.write IO.ANSI.clear()
    print(map, width)
  end

  def print(row, width) when length(row) == width do
    row
    |> Enum.map(&(if &1, do: "X", else: " "))
    |> IO.puts
  end
  def print(row, width) do
    {row, rest} = Enum.split(row, width)
    print(row, width)
    print(rest, width)
  end
end
