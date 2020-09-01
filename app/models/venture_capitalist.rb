class VentureCapitalist

    attr_accessor :name
    attr_reader :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
    end 

    def self.all
        @@all
    end 

    def self.tres_commas_club
        self.all.select{|capitalist| capitalist.total_worth > 1000000000}
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select{|rounds| rounds.venture_capitalist == self}
    end 

    def portfolio
        (self.funding_rounds.collect{|rounds| rounds.startup.name}).uniq
    end 

    def biggest_investment
        self.funding_rounds.max_by{|rounds| rounds.investment}
    end

    def invested(domain_find)
        (self.funding_rounds.select{|rounds| rounds.startup.domain == domain_find}).sum{|rounds| rounds.investment}
    end 

end
