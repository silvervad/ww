class Season < ActiveRecord::Base
  belongs_to :spot
  belongs_to :sport
  
  
  def get_months_array
    
    month_names = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      
    season_style = [
     '#444444', #low
     '#999999', #medium
     '#33CC66'  #high
    ]
    
    tooltips = [
      'Low',
      'Medium',
      'High'
    ]
    
    elements = months.split ''  #convert string to array of chars
    
    # creates array of ["Jan", 3, "color: '#00CCCC'"] kind
    result = month_names.map.with_index { |x, i| 
      highness = elements[i].to_i
      [ x, highness, 'color: ' + season_style[ highness - 1 ].to_s, tooltips[ highness - 1] ]
    }
    # Column 0: empty strings instead of Month and Season, not to show them
    result.unshift ['Month', 'Season', { role: 'style' }, {role: 'tooltip'}]
    
  end
end
