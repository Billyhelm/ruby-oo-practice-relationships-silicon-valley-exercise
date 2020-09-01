class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder)
        @name = name
        @founder = founder
        @domain = domain
        self.class.all << self
    end 

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end 

    def self.all
        @@all
    end 

    def self.find_by_founder(input)
        self.all.find{|startups| startups.founder == input}
    end 

    def self.domains
        self.all.collect{|startups| startups.domain}
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end 

    def num_funding_rounds
        (FundingRound.all.select{|rounds| rounds.startup == self}).count
    end 

    def total_funds
        (FundingRound.all.select{|rounds| rounds.startup == self}).sum{|rounds| rounds.investment}
    end 

    def investors
        (FundingRound.all.select{|rounds| rounds.startup == self}).collect{|rounds| rounds.venture_capitalist}
    end 

    def big_investors
        self.investors.select do |investors|
            VentureCapitalist.tres_commas_club.include?(investors)
        end 
    end 

end
