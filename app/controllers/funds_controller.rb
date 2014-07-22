class FundsController < ApplicationController
    
  def new
    @fund = Fund.new
  end
  def show
    @fund = Fund.find(params[:id])
  end
  
  def create
    
  end
  
  def funds_required
    @fund = current_client.fund
    if @fund == nil
      @fund = Fund.new
      @fund.client = current_client
      p "new"
    else
      p "exist"
    end
  
  end
end
