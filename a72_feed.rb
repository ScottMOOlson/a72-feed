require 'time'

module A72Feed
  def self.google_meeting_to_tsml(m)
    {
      name: m['name'],
      day: m['day'].to_i,
      time: m['time'],
      location: m['location'],
      formatted_address: m['formatted_address'],
      district: m['district'],
      district_id: m['district_id'],
      types: m['types'],  # This might be an array of TSML format codes like ["O", "D"]
      region: m['region'],  # Optional but useful if present
      group: m['group'],    # Group name, if available
      slug: m['slug'],      # Unique meeting identifier
      latitude: m['latitude'],
      longitude: m['longitude']
    }.compact  # Removes nil values to keep JSON clean
  end
end

  def self.time(s)
    Time.parse(s).strftime("%H:%M") rescue ""
  end

  def self.types(s)
    s.split(",").map(&:strip)
  end
end
