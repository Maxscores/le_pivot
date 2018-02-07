class StoresController < ApplicationController

  def index
    @stores = current_user.stores
  end

  def new
    @store = Store.new
  end

  def create
    store = Store.new(store_params)
    store.status = "pending"
    current_user.stores << store
    if store.save!
      redirect_to dashboard_index_path
    else
      flash[:notice] = "Invalid Credentials"
      render :new
    end
  end

private

  def store_params
    params.require(:store).permit(:name, :address)
  end

end
