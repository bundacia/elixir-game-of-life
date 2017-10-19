defmodule Mix.Tasks.CLI do
  use Mix.Task

  def run(_), do: Gol.CLI.run()
    
end
