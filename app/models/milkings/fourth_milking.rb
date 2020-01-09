module Milkings
  class FourthMilking < Milking
    #this sorts out routing issues for subclassing

    def self.model_name
      Milking.model_name
    end


  end
end
