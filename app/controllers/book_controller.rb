class BookController < ApplicationController
  def flight

    source = params[:src].to_s
    destination = params[:dest].to_s
    dateofdeparture = params[:dept].to_s
    dateofarrival = params[:arr].to_s
    seatingclass = params[:class].to_s
    adults = params[:adults].to_s
    children = params[:child].to_s
    infants = params[:infants].to_s
    counter = params[:counter].to_s 		# 0 - international , 100 - domestic

    uri= URI.parse("https://developer.goibibo.com/api/search/")
	req = Net::HTTP::Get.new(url.to_s)
	url.query = URI.encode_www_form({  "source" => source ,
										"destination" => destination, 
					                    "dateofdeparture" => dateofdeparture, 
					                    "dateofarrival" => dateofarrival ,
					                    "seatingclass" => seatingclass,
					                    "children" => adults ,
					                    "children" => children ,
					                    "infants" => infants ,
					                    "counter" => counter 
					                })
	out= JSON.parse Net::HTTP.get_response(url).body

  end
end
