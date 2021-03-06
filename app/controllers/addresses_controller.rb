class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save?
      redirect_to root_path
    else
      render :new
    end


  end


  def edit
    @address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:user_id, :label, :street_address, :city, :state, :zip)

  end

end
