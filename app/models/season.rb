class Season < ActiveRecord::Base
	belongs_to :sport
	belongs_to :spot

	def get_months
   		['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
  			'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  	end

  	def get_seasons
  		[self.jan, self.feb, self.mar, self.apr, self.may, self.jun, self.jul,
  			self.aug, self.sep, self.oct, self.nov, self.dec]
  	end
end
