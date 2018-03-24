module VaccinationsHelper

  def vaccination_bar_chart_under23_age_data
    @vaccination_data = {
      labels: Vaccination.all.collect(&:title),
      datasets: [
        {
          background_color: ["#a3e1d4", "#B5B8CF", "#a3e1d4", "#B5B8CF"],
          data:  Vaccination.all.collect{|v| v.babies.where("babies.age >= ? and babies.age <= ?", 0, 23).count}
        }
      ]
    }
  end


  def vaccination_bar_chart_over23_age_data
    @vaccination = {
      labels: Vaccination.all.collect(&:title),
      datasets: [
        {
          background_color: ["#a3e1d4", "#B5B8CF", "#a3e1d4", "#B5B8CF"],
          data:  Vaccination.all.collect{|v| v.babies.where("babies.age >= ? and babies.age <= ?", 24, 60).count}
        }
      ]
    }
  end
end