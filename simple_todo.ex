defmodule TodoList do
  def new(), do: %{}

  def add_entry(todo_list, date, title) do
    Map.update(
      todo_list,
      date,
      [title],
      fn titles -> [title | titles] end
    )
  end

  def entries(todo_list, date) do
    Map.get(todo_list, date, [])
  end

  def test do
    todo_list =
      new()
      |> add_entry(~D[2018-12-19], "Dentis")
      |> add_entry(~D[2018-12-20], "Shopping")
      |> add_entry(~D[2018-12-21], "Movies")

    entries(todo_list, ~D[2018-12-19])
    # entries(todo_list, ~D[2018-12-20])
    # entries(todo_list, ~D[2018-12-21])
  end
end
