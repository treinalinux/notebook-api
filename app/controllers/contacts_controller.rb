# frozen_string_literal: true

# Class ContactsController
class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    # render json: @contacts
    # render json: @contacts, status: :partial_content
    # render json: @contacts, root: true
    # render json: @contacts, only: [:name, :email]
    # render json: @contacts, except: [:name, :email]
    # render json: @contacts.map { |contact| contact.attributes.merge({ author: "Moises" }) }
    # render json: @contacts, methods: :author
    # render json: @contacts, status: :partial_content
    #
    # render json: @contacts, methods: :birthdate_br
    render json: @contacts
  end

  # GET /contacts/1
  def show
    # render json: @contact
    # render json: @contact.attributes.merge({ author: "Moises" })
    # render json: @contact.to_br
    #
    # render json: @contact, include: %i[kind phones address]
    # render json: @contact, include: [:kind] # , meta: { author: 'Alan da Silva Alves' }
    render json: @contact, include: %i[kind phones address]
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, include: %i[kind phones address], status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: %i[kind phones address]
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    #   params.require(:contact).permit(
    #     :name, :email, :birthdate, :kind_id,
    #     phones_attributes: %i[id number _destroy],
    #     address_attributes: %i[id street city]
    #   )
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
