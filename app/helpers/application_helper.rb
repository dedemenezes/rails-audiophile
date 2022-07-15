module ApplicationHelper
  def image_folder_name(record)
    record.name.downcase.gsub(' ', '-').gsub('-i-', '-one-').gsub('-ii-', '-two-').gsub('-wireless-', '-')
  end
end
