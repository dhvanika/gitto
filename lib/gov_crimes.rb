class GovCrimes
  def initialize(ward=5)
    @ward = ward.to_s
    @date = (Date.today - 365).to_s
  end

  def number
    response.parsed_response[0]["count_ward"]
  end

  def response
    @response ||= HTTParty.get(url)
  end

  def url
    url = "http://data.cityofchicago.org/resource/x2n5-8w5q.json"
    url << "?$select=count%28ward%29"
    url << "&$where=date_of_occurrence%3E%27" + @date
    url << "%27&ward=" + @ward
    url << "&$group=ward"
  end

end
