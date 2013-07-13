class GetWard
  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def url
    url = "http://boundaries.tribapps.com/1.0/boundary/?sets=wards"
    url << "&contains=#{@lat},#{@lon}"
  end

  def response
    @response ||= HTTParty.get(url)
  end

  def ward_number
    response.parsed_response["objects"][0]["metadata"]["WARD"]
  end
end
