# For tuples (immutable data structure) use, e.g. tuple = {"Name", age, "City", "State"}:
  # elem(tup, pos) to retrieve element
  # put_elem(tup, pos, value) to insert an element
  # Remeber that if you insert an element you need to assign to a variable again
  # Because the previous variable is immutable
  # Or reassign to the same var = put_elem(var, pos, value) to use the elements that are the same
  # And use garbage collector to discard unused elements
# For lists (mutable and dynamic data structure) use, e.g. list = [1, 2, 3, 4]:
  # length(list)
  # Enum.at(list, pos)
  # x in list
  # List.replace_at(list, pos, value)
  # List.insert_at(list, pos, value)
  # List.inser_at(list, -1, value) to insert at the end of a list
  # list ++ list2 concatenate lists
  # hd(list) retrieves the first element
  # tl(lsit) retrieves the rest of the elements from hd()
# For maps (hashmaps, for dynamically sized key:value structure or simple records) use, e.g. map = %{key => value, key2 => value2}
  # map[key] retrieves the value for the key named passed
  # Map.get(map, key) does the same as before
  # Also could be built using atoms instead of key =>, e.g. map = %{name: "Thomaz", age: 24} name: is an atom with : on the other side
  # With the previous map in mind, access the value using map.atom, e.g. map.name gets "Thomaz"
  # The same happens with map[:atom], e.g. map[:name] gets "Thomaz"
  # If you want to change a value you'll need to assign to a new variable using new_map = %{map | name: "Thomaz Guadagnini"}

# Module and function creation
defmodule Scripts do
  def eq_10(a) do
    cond do
      a > 0 and a <= 5 ->
        "Between 0 and 5"
      a > 5 and a <= 10 ->
        "Between 5 and 10"
      true ->
        "Greater than 10"
    end
  end
  def power(a, b) do
    Integer.pow(a, b)
  end
end

# Create a variable that acts as a function (kinda macro)
# Variable x is a function that prints the argument divided by 2
x = fn a -> IO.puts(div(a, 2)) end

x.(number)

# Map each element of a list
b = [1, 2, 4, 6, 8, 10]
Enum.each(b, x)
# Same way but using a function inside a variable (bytwo)
# that calls another function (x) that is a variable
bytwo = fn l -> Enum.each(l, x) end
bytwo.(b)

# Capture operator
lambda = fn x, y, z -> z * y + x end
# is the same as using capture operator which is:
lambda = &(&1 * &2 + &3)
lambda.(2, 3, 4)
