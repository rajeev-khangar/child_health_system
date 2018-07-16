class NotifierMailer < ApplicationMailer
  
  def send_email(baby)
    @baby = baby
    @email = @baby.mother.try(:email) || @baby.father.try(:email)
    mail(to: @email, subject: "Child-Health-Care – Vaccinations Awareness for #{@baby.full_name}") if @email
  end

end