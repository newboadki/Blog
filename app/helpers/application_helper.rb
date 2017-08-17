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

  # some view elements with query this method to style certain elements.
  def background_color_css_selector_for(theme)
    return "with-clear-background" if theme == :home_page_style
    return "with-colored-background" if theme == :articles_page_style
    return ""
  end

  # But because in the same view a set of elements need to have a different css property
  # we complement the use of these two methods
  def complementary_background_color_css_selector_for(theme)
    return "with-colored-background" if theme == :home_page_style
    return "with-clear-background" if theme == :articles_page_style
    return ""
  end


end
