require "uri"
require "net/http"
require 'json'
require 'pry'
require 'platform-api'

class BookController < ApplicationController
  def flight
  	@gender_options = ["male","female"]
    @ethnicity_options = ["asian","american","white"]
    source = params[:src].to_s
    destination = params[:dest].to_s
    dateofdeparture = params[:dept].to_s
    dateofarrival = params[:arr].to_s
    seatingclass = params[:class].to_s
    adults = params[:adults].to_s
    children = params[:child].to_s
    infants = params[:infants].to_s
    counter = params[:counter].to_s 		# 0 - international , 100 - domestic

    url= URI.parse("https://developer.goibibo.com/api/search/")
	req = Net::HTTP::Get.new(url.to_s)
	url.query = URI.encode_www_form({  "app_id" => "01d613cc" ,
										"app_key" => "2d974c23eaa3034771edbe80db153a34" ,
									   "source" => source ,
										"destination" => destination, 
					                    "dateofdeparture" => dateofdeparture, 
					                    "dateofarrival" => dateofarrival ,
					                    "seatingclass" => seatingclass,
					                    "children" => adults ,
					                    "children" => children ,
					                    "infants" => infants ,
					                    "counter" => counter 
					                })
	#out= JSON.parse Net::HTTP.get_response(url).body

  end
end
