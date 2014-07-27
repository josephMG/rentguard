class ContactsController < ApplicationController
  before_action :set_agent
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :set_default]

  def show
  end

  def new
    @contact = @agent.contacts.build
  end

  def edit
  end

  def create
    @contact = @agent.contacts.build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to agent_contact_url(@agent,@contact), notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to agent_contact_url(@agent,@contact), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @contact==@agent.contact
      @agent.contact=nil
      @agent.save
    end
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to agent_url(@agent), notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def set_default
    @agent.contact=@contact
    @agent.save
    redirect_to agent_url(@agent), notice: "Set default to #{@contact.email}" 
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:agent_id])
    end
    def set_contact
      @contact = @agent.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:email)
    end
end
