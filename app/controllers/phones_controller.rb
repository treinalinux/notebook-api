# frozen_string_literal: true

# class PhonesController
class PhonesController < ApplicationController
  # before_action :set_phones
  before_action :set_contact

  def destroy
    phone = Phone.find(phone_params[:id])
    phone.destroy
  end

  def create
    @contact.phones << Phones.new(phone_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    phone = Phone.find(phone_params[:id])

    if phone.update(phone_params)
      render json: @contact.phones
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def show
    # render json: @phones
    render json: @contact.phones
  end

  private

  # def set_phones
  def set_contact
    # phones = Contact.find(params[:contact_id]).phones
    @contact = Contact.find(params[:contact_id])
  end

  def phone_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
