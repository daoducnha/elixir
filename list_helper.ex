defmodule ListHelper do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def sum(list) do
    do_sum(0, list)
  end

  defp do_sum(current_sum, []) do
    current_sum
  end

  defp do_sum(current_sum, [head | tail]) do
    new_sum = head + current_sum
    do_sum(new_sum, tail)
  end

  def test do
    Enum.reduce(
      [1, 2, "Not a number", 3, :x, 4],
      0,
      fn
        element, sum when is_number(element) ->
          sum + element

        _, sum ->
          sum
      end
    )
  end
end
