
Vaccination.where(age: "Birth/First Contact",title: "BCG", description: "Primary course").first_or_create
Vaccination.where(age: "6 weeks", title: "Pentavelent 1, OPV 1,ROTAVIRUS 1", description: "Primary course").first_or_create
Vaccination.where(age: "10 weeks", title: "Pentavelent 1, OPV 1,ROTAVIRUS 1", description: "Primary course").first_or_create
Vaccination.where(age: "18 months", title: "DTP and OPV", description: "Boosters").first_or_create

RiskFactor.where(title: "Birth Weight less than 2.5 kgs").first_or_create
RiskFactor.where(title: "Fifth child or more").first_or_create
RiskFactor.where(title: "Birth Intervals Less than 2 years").first_or_create
RiskFactor.where(title: "Multiple Births").first_or_create
RiskFactor.where(title: "MTCT").first_or_create
RiskFactor.where(title: "Death of any child under 5 in family").first_or_create
RiskFactor.where(title: "Single Parents").first_or_create
RiskFactor.where(title: "Maternal Death").first_or_create

["Birth", "6W", "10W", "14W", "5M","6M","7M","8M", "9M","10M","11M","12M","13M","14M","15M","16M","17M","18M","19M","20M","21M","22M","23M","24M"].each_with_index do | title, index|

  InfantFeedingMonth.where(title: title ,order: index+1).first_or_create
end

["6W", "10W", "14W", "5M","6M","7M","8M", "9M","10M","11M","12M","13M","14M","15M","16M","17M","18M","19M","20M","21M","22M","23M","24M"].each_with_index do | title, index|

  CareMonth.where(title: title ,order: index+1).first_or_create
end