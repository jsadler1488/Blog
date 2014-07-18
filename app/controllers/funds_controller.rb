class FundsController < ApplicationController
  def check_funds
    
    if @fund.nil?
      redirect_to 'funds/new'    
    elsif @fund.avail_amount.to_i > 1000
      redirect_to 'funds/submit_funds'
    else
      redirect_to 'funds/funds_required'
    end
  end
end
