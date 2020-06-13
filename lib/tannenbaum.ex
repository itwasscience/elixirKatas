defmodule KataTannenbaum do
  def tree(size) do
    output =
      Range.new(1, size)
      |> Enum.reduce("", fn x, acc -> acc <> draw_segment(x, size) end)

    "\n" <> output <> draw_trunk(size)
  end

  def tree_with_star(size) do
    "\n" <> draw_star(size) <> tree(size)
  end

  defp draw_segment(x, size) do
    String.duplicate(" ", size - x) <> String.duplicate("X", 2 * x - 1) <> "\n"
  end

  defp draw_trunk(size) do
    String.duplicate(" ", size - 1) <> "I\n"
  end

  defp draw_star(size) do
    String.duplicate(" ", size - 1) <> "🟍\n"
  end
end
