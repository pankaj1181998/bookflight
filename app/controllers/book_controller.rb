require "uri"
require "net/http"
require 'json'
require 'pry'
require 'platform-api'

class BookController < ApplicationController
  respond_to :js, :html, :json
  before_action :flight
  # attr_accessor :src, :api
  # validates :should_not_be_equal
  
  # def should_not_be_equal
  #   if :src.present? && dest.present? 
  #     errors.add(:src,"Source & destination can't be same") if :src == :dest
  #   end  
  # end


  def flight
  	
    @codes = []
    IataCode.all.each do |x|
      @codes << [ x.city , x.airport , x.code]
    end
    p1 = params[:start_date]
    
    if p1!=nil
    date1 = p1["year"]
      if p1["month"].to_i < 10
         date1 = date1 + "0" +p1["month"]
      else
        date1 = date1 + p1["month"]
      end
      
      if p1["day"].to_i < 10
         date1 = date1 + "0" +p1["day"]
      else
        date1 = date1 + p1["day"]
      end
    end

    p2 = params[:end_date]
    
    if p2!=nil
    date2 = p2["year"]
      if p2["month"].to_i < 10
         date2 = date2 + "0" +p2["month"]
      else
        date2 = date2 + p2["month"]
      end
      
      if p2["day"].to_i < 10
         date2 = date2 + "0" +p2["day"]
      else
        date2 = date2 + p2["day"]
      end
    end
   
   

    source = params[:src].to_s
    destination = params[:dest].to_s
    dateofdeparture = date1.to_s
    dateofarrival = date2.to_s
    seatingclass = params[:class].to_s
    adults = params[:adults].to_s
    children = params[:child].to_s
    infants = params[:infants].to_s
    counter = params[:counter].to_s 		# 0 - international , 100 - domestic
   if source == destination
    flash[:notice] = "Source and Destination Can't be Same!!!"
   end

   if adults == "" || adults == "0"
     adults ="1"
   end

   if children == ""
     children = "0"
   end

   if infants == ""
    infants = "0"
  end

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
    p "completed"
		res = Net::HTTP.get_response(uri)
		# => puts res.body if res.is_a?(Net::HTTPSuccess)
		@result = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
    

    
	    rescue => e
	        puts "failed #{e}"
     end
	
    render "book/flight"
    # respond_to do |format|
    #     format.html { render :controller =>"book", :action => "flight" }
    #     format.json { render  @result }
    #     #format.js
    #   end

  
  end

end
