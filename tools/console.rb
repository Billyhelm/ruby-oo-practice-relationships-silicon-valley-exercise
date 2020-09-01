require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

blah = Startup.new("company_name", "billy")
t = Startup.new('second_company', "tom")
t.pivot("website", "company4434")
blah.pivot("this is a domain", "companyX")
e = Startup.find_by_founder("billy")
tyler = VentureCapitalist.new("tyler",100000)
ryan = VentureCapitalist.new("ryan",2000000000)
p1 = FundingRound.new(t, tyler, "Series A", 50000000)
p2 = FundingRound.new(blah, ryan, "Seed", 1000000)
p3 = FundingRound.new(t, tyler, "Series B", 500000)
ryan.offer_contract(blah, "type z", 47)
binding.pry

0 #leave this here to ensure binding.pry isn't the last line 