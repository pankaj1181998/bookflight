class HomeController < ApplicationController
  def view
  	
  	@codes = []
  	
    IataCode.all.each do |x|
      @codes << [ x.city , x.airport , x.code]
	  end
  end
end
