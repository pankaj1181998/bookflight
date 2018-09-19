class PrivacyController < ApplicationController
  def policy
  	@codes = []
  	
    IataCode.all.each do |x|
      @codes << [ x.city , x.airport , x.code]
	  end
  end
end
