class NotifierMailer < ApplicationMailer
  
  def send_email(baby)
    @baby = baby
    @email = @baby.mother.try(:email)
    mail(to: @email, subject: "Child-Health-Care – Vaccinations Awareness for #{@baby.full_name}")
  end

end