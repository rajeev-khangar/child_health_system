module HealthsHelper
  LABEL =  (0..60).collect {|x| x }
  
  def height_age_chart_data(babies)
    @data = {
      labels: LABEL,
        datasets: [
        {
          radius: 0,
          tension: 0.6,
          label: "Severe stunted",
          border_color: "#a3e1d4",
          background_color: "rgba(0,0,0,0.0)",
          data: Baby::SEVERE_STUNTED_HEIGHT
          
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Moderate stunted",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#1AB394',
          data: Baby::MODERATE_STUNTED_HEIGHT
          
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Normal",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9CC3DA',
          data: Baby::NORMAL 
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Normal 2",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#B5B8CF',
          data: Baby::NORMAL2 
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Possible very tall",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9fe3f2',
          data: Baby::POSSIBLE_VERY_TALL
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Capture Data",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#000000',
          data: (0..60).collect{ |age| Baby.avg_height(babies.where(age: age))}
        }
      ]
    }
 end

  def weight_age_chart_data(babies)
    @weight_data = {
      labels: LABEL,
        datasets: [
        {
          radius: 0,
          tension: 0.6,
          label: "Severe underweight",
          border_color: "#a3e1d4",
          background_color: "rgba(0,0,0,0.0)",
          data:  Baby::SEVERE_UNDER_WEIGHT
          
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Moderate underweight",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#1AB394',
          data:  Baby::MODERATE_UNDER_WEIGHT
          
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Normal",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9CC3DA',
          data: Baby::NORMAL_WEIGHT 
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Possible overweight",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#B5B8CF',
          data: Baby::POSSIBLE_OVERWEIGHT
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Check weight - for height",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9fe3f2',
          data: Baby::CHECK_WEIGHT_FOR_HEIGHT
        },
        {
          radius: 0,
          tension: 0.6,
          label: "Capture Data",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#000000',
          data: (0..60).collect{ |age| Baby.avg_weight(babies.where(age: age))}
        }
      ]
    }
  end
end
      

