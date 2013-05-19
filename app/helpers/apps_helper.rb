module AppsHelper

  def transform_image_name_to_id (original_string)  	
  	last_component = original_string.split(/\//).last()  	
  	return last_component.gsub(/\.png|\.jpeg|\.jpg|\.gif/, "")
  end

end
