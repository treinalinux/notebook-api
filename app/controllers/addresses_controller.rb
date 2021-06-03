# frozen_string_literal: true

# class AddressesController
class AddressesController < ApplicationController
  # before_action :set_address
  before_action :set_contact

  def destroy
    @contact.address.destroy
  end

  def create
    @contact.address = Address.new(address_params)

    if @contact.save
      render json: @contact.address, status: :created, location: contact_address_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.address.update(address_params)
      render json: @contact.address
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def show
    # render json: @address
    render json: @contact.address
  end

  private

  # def set_address
  def set_contact
    # address = Contact.find(params[:contact_id]).address
    @contact = Contact.find(params[:contact_id])
  end

  def address_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
