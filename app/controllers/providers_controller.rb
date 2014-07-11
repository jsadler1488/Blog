class ProvidersController < ApplicationController
  before_action :authenticate_client!, except: [:show_profile_image, :index, :show] 
  before_action :authenticate_provider!, except: [:show_profile_image, :index, :show]
  def index
    @providers = Provider.joins("LEFT OUTER JOIN reviews ON reviews.provider_id = providers.id") \
      .where(public: true) \
      .group("providers.id")\
      .order("avg(reviews.rating) DESC NULLS LAST")\
      .paginate(page: params[:page], per_page: 10)
    
  end
  
  def show
    @provider = Provider.find(params[:id])
  end
  
  def show_profile_image
    @provider = Provider.find(params[:id])
    @image = @provider.profile_image
    send_data @image, type: 'image/png', disposition: 'inline'
  end
end
