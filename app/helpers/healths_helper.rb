module HealthsHelper
	 TOTAL_COLOR = ["#a3e1d4", "#9CC3DA", "#dedede", "#B5B8CF","#e88892", "#f7cf8f", "#9fe3f2", "edbef7", "f4db97"]

	def height_age_chart_data(babies)
		
		@data = {
			labels: [0, 12, 24, 36, 48, 60],
			datasets: [
        {
          radius: 0,
          tension: 0.6,
          label: "Severe stunted",
          border_color: "#a3e1d4",
          background_color: "rgba(0,0,0,0.0)",
          data: [0, 10, 20, 30, 40, 50]
          
        },
        {
          tension: 0.6,
          label: "Moderate stunted",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#1AB394',
          data: [0, 20, 30, 40, 50,60]
          
        },
        {
          tension: 0.6,
          label: "Normal",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9CC3DA',
          data: [0, 30, 40, 50,60, 70]
        },
        {
          tension: 0.6,
          label: "Normal 2",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#B5B8CF',
          data: [0, 40, 50, 60, 70, 80]
        },
        {
          tension: 0.6,
          label: "Possible very tall",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9fe3f2',
          data: [0, 50, 60, 70, 80, 90]
        },
        {
          tension: 0.6,
          label: "Capture Data",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#000000',
          data: [Baby.avg_height(babies.where("age > ? and age <= ?", 0, 12)), Baby.avg_height(babies.where("age > ? and age <= ?", 12, 24)), Baby.avg_height(babies.where("age > ? and age <= ?",24, 36)), Baby.avg_height(babies.where("age > ? and age <= ?",36, 48)), Baby.avg_height(babies.where("age > ? and age <= ?",48, 60))]
        }
      ]
    }
 end

  def weight_age_chart_data(babies)
		@weight_data = {
			labels: ["0", "0-12", "12-24", "24-36", "36-48", "48-59"],
			datasets: [
        {
          radius: 0,
          tension: 0.6,
          label: "Severe underweight",
          border_color: "#a3e1d4",
          background_color: "rgba(0,0,0,0.0)",
          data: [0, 40, 50, 60, 70, 80]
          
        },
        {
          tension: 0.6,
          label: "Moderate underweight",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#1AB394',
          data: [0, 50, 60, 70, 80, 90]
          
        },
        {
          tension: 0.6,
          label: "Normal",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9CC3DA',
          data: [0, 60, 70, 80, 90, 100]
        },
        {
          tension: 0.6,
          label: "Possible overweight",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#B5B8CF',
          data: [0, 70, 80, 90, 100, 110]
        },
        {
          tension: 0.6,
          label: "Check weight - for height",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#9fe3f2',
          data: [0, 80, 90, 100, 110, 120]
        },
        {
          tension: 0.6,
          label: "Capture Data",
          background_color: "rgba(0,0,0,0.0)",
          border_color: '#000000',
          data: [Baby.avg_weight(babies.where("age > ? and age <= ?", 0, 12)),Baby.avg_weight(babies.where("age > ? and age <= ?", 12, 24)),Baby.avg_weight(babies.where("age > ? and age <= ?", 24, 36)),Baby.avg_weight(babies.where("age > ? and age <= ?", 36, 48)),Baby.avg_weight(babies.where("age > ? and age <= ?", 48, 59))]
        }
      ]
    }
 end
end
      

