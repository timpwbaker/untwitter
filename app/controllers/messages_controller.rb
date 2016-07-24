# Messages Controller. Inherits from Application
class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all.reverse
    @message = Message.new
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    # hard coded user ID to be replaced in next iteration
    @message.user_id = User.first.id
    respond_to do |format|
      if @message.save
        params.delete(:message_body)
        format.json { render :index, status: :created}
        format.js # looks for create.js.erb in the views/messages folder
      else
        format.js { render action: 'create_fail' }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js # looks for destroy.js.erb in the views/messages folder
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow the white list parameters through.
  def message_params
    params.require(:message).permit(:message_body, :user_id)
  end
end
