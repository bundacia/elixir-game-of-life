defmodule Gol.GolTest do
  use ExUnit.Case, async: true

  import Gol

  test "next_tick" do
    {x, o} = {true, false}
    map1 = [
      o, o, o, o, o,
      o, o, x, o, o,
      o, o, x, o, o,
      o, o, x, o, o,
      o, o, o, o, o,
    ]

    map2 = [
      o, o, o, o, o,
      o, o, o, o, o,
      o, x, x, x, o,
      o, o, o, o, o,
      o, o, o, o, o,
    ]

    assert next_tick(map1) == map2
  end

end
