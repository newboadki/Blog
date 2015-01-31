module AppsHelper

  def transform_image_name_to_id (original_string)
	  	last_component = original_string.split(/\//).last()  	
	  	return last_component.gsub(/\.png|\.jpeg|\.jpg|\.gif/, "")
  end

  def matrix_rows(apps, apps_per_row)
    rows = []
    number_of_rows = (apps.count.to_f / apps_per_row.to_f).ceil()

    number_of_rows.times do |i|
      offset = (apps_per_row * i)
      limit = (offset + apps_per_row - 1) # -1 because we are calculating a 0-based index.
      rows << apps[offset .. limit]
    end

    rows
  end

end
