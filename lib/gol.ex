defmodule Gol do
  @moduledoc """
  Gol keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def next_tick(map) do
    map
    |> Enum.with_index
    |> Enum.map(fn {alive, i} -> next_state(map, i, alive) end)
  end

  defp next_state(map, i, alive) do
    case get_neighbor_count(map, i) do
      x when x < 2  -> false
      x when x == 2 -> alive
      x when x == 3 -> true
      x when x > 3  -> false
    end
  end

  defp get_neighbor_count(map, i) do
    neighbors(map, i)
    |> Enum.filter(&(&1))
    |> Enum.count
  end

  defp neighbors(map, i) do
    width = map |> Enum.count |> :math.sqrt |> round
    {row, col} = row_col(map, i)
    [
      {row-1, col-1}, {row-1, col}, {row-1, col+1},
      {row  , col-1}              , {row  , col+1},
      {row+1, col-1}, {row+1, col}, {row+1, col+1},
    ]
    |> Enum.map(fn {r,c} -> r * width + c end)
    |> Enum.map(&Enum.at(map, &1))
  end

  defp row_col(map, i) do
    width = map |> Enum.count |> :math.sqrt |> round
    row = div(i, width)
    col = rem(i, width)
    {row, col}
  end

end
