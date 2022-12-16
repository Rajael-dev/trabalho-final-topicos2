class ContactsController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_contact, only: %i[ show edit update destroy ]
  before_action :set_region_options, only: %i[new create edit update]

  # GET /contacts or /contacts.json
  def index
    if current_user.is_admin == 1
      @contacts = Contact.all
    else
      @contacts = current_user.contacts
    end
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = current_user.contacts.build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url(@contact)}
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact)}
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      if current_user.is_admin == 1
        @contact = Contact.all.find(params[:id])
      else
        @contact = current_user.contacts.find(params[:id])
      end

      self.send_error_info unless @contact.present?
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :phone, :region_id)
    end

    def set_region_options
      if current_user.is_admin == 1
        @region_options = Region.all.pluck(:ddd, :id)
      else
        @region_options = current_user.regions.pluck(:ddd, :id)
      end
    end
end
