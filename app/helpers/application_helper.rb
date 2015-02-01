module ApplicationHelper

  # This method takes any kind of objects and organise them into an array of arrays
  # Items will be organised by rows. When a row is filled (the maximum is reached), then we moved on to the next one.
  def matrix_rows(items, items_per_row)
    rows = []
    number_of_rows = (items.count.to_f / items_per_row.to_f).ceil()

    number_of_rows.times do |i|
      offset = (items_per_row * i)
      limit = (offset + items_per_row - 1) # -1 because we are calculating a 0-based index.
      rows << items[offset .. limit]
    end

    rows
  end

end
