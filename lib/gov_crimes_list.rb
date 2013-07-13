class GovCrimesList
  def initialize(ward=5)
    @ward = ward.to_s
    @date = (Date.today - 20).to_s
  end

  def response
    @response ||= HTTParty.get(url)
  end

  def url
    url = "http://data.cityofchicago.org/resource/x2n5-8w5q.json?"
    url << "&$where=date_of_occurrence%3E%27" + @date
    url << "%27&ward=" + @ward
  end

  def last_crimes
    list = response.parsed_response[-10..-1].map do |crime|
      {
        description: (crime["_primary_decsription"] + " " + crime["_secondary_description"])[0..26].capitalize,
        time: DateTime.parse(crime["date_of_occurrence"]).strftime("%H:%M, %B %-d")
      }
    end
    list.reverse
  end

end

