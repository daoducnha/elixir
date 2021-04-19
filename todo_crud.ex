defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.auto_id)

    new_entries =
      Map.put(
        todo_list.entries,
        todo_list.auto_id,
        entry
      )

    %TodoList{todo_list | entries: new_entries, auto_id: todo_list.auto_id + 1}
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn _ -> new_entry end)
  end

  def update_entry(todo_list, entry_id, update_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        todo_list

      {:ok, old_entry} ->
        new_entry = update_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(todo_list, entry_id) do


    new_entries = todo_list.entries
    |> Stream.filter(fn {_, entry} -> entry.id != id end)
    |> Enum.map({_, entry} -> entry)

    %TodoList{todo_list | entries: new_entries}
  end

  def test() do
    todo_list =
      TodoList.new()
      |> TodoList.add_entry(%{date: ~D[2018-12-19], id: 1, title: "Dentist"})
      |> TodoList.add_entry(%{date: ~D[2018-12-20], id: 2, title: "Shopping"})
      |> TodoList.add_entry(%{date: ~D[2018-12-19], id: 3, title: "Movies"})

    # todo_list.update_entry(
    #   todo_list,
    #   1,
    #   &Map.put(&1, :date, ~D[2018-12-20])
    # )

    IO.puts(todo_list)
  end
end
