module ApplicationHelper
  def formatted_time(timestamp)
    Time.use_zone("Central Time (US & Canada)") do
      Time.zone.at(timestamp).strftime("%B #{timestamp.day.ordinalize}, %Y")
    end
  end
end
