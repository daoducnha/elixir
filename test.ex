defmodule StreamTesting do
  def test1 do
    employees = ["Alice", "Bob", "John"]

    employees
    |> Enum.with_index()
    |> Enum.each(fn {emp, index} ->
      IO.puts("#{index + 1}. #{emp}")
    end)
  end

  def test2 do
    employees = ["Alice", "Bob", "John"]

    employees
    |> Stream.with_index()
    |> Enum.each(fn {emp, index} ->
      IO.puts("#{index + 1}. #{emp}")
    end)
  end

  def test3 do
    [0, -1, "foo", 24, 49]
    |> Stream.filter(&is_number(&1) and &1 > 0)
    |> Stream.map(&{&1, :math.sqrt(&1)})
    |> Stream.with_index
    |> Enum.each(
      fn {{input, result}, index} ->
        IO.puts("#{index + 1}. sqrt(#{input}) = #{result}")
      end
    )
  end

  def test4 do
    days = MapSet.new()
    |> MapSet.put(1)
    |> MapSet.put(2)

    IO.puts(days)


  end
end
