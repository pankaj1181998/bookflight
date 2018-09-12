require "uri"
require "net/http"
require 'json'
require 'pry'
require 'platform-api'

class BookController < ApplicationController
  respond_to :js, :html, :json
  before_action :flight
  
  def flight
  	@detail = nil
  	@codes = []
  	IataCode.all.each do |x|
    @codes << [ x.city , x.airport , x.code]
	end
    
    source = params[:src].to_s
    destination = params[:dest].to_s
    dateofdeparture = params[:dept].to_s
    dateofarrival = params[:arr].to_s
    seatingclass = params[:class].to_s
    adults = params[:adults].to_s
    children = params[:child].to_s
    infants = params[:infants].to_s
    counter = params[:counter].to_s 		# 0 - international , 100 - domestic

    @total = adults.to_i + children.to_i + infants.to_i
    @param1 = adults.to_i
    @param2 = children.to_i
    @param3 = infants.to_i
    begin
        
    	uri = URI('https://developer.goibibo.com/api/search/')
		params = {  "app_id" => "01d613cc" ,
					"app_key" => "2d974c23eaa3034771edbe80db153a34" ,
				   "source" => source ,
					"destination" => destination, 
	                "dateofdeparture" => dateofdeparture, 
	                "dateofarrival" => dateofarrival ,
	                "seatingclass" => seatingclass,
	                "children" => adults ,
	                "children" => children ,
	                "infants" => infants ,
	                "counter" => "100" }
		uri.query = URI.encode_www_form(params)

		res = Net::HTTP.get_response(uri)
		# => puts res.body if res.is_a?(Net::HTTPSuccess)
		@result = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
        
	    rescue => e
	        puts "failed #{e}"

	end
	
 #  respond_to do |format|
 #      format.html 
 #      format.json { render: @result }
 #      format.js
 #    end

  
  end

end
