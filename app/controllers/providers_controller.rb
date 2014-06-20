class ProvidersController < ApplicationController
  before_action :authenticate_user!
  def index
    @providers = Provider.all
  end
  
  def show
    @provider = Provider.find(params[:id])
  end
end
