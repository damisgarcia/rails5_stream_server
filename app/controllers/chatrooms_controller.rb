class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  # GET /chatrooms
  def index
    @chatrooms = Chatroom.all
  end

  # GET /chatrooms/1
  def show
    @message = Message.new
  end

  # GET /chatrooms/new
  def new
    @chatroom = Chatroom.new
  end

  # GET /chatrooms/1/edit
  def edit
  end

  # POST /chatrooms
  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      redirect_to @chatroom, notice: 'Chatroom was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /chatrooms/1
  def update
    if @chatroom.update(chatroom_params)
      redirect_to @chatroom, notice: 'Chatroom was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chatrooms/1
  def destroy
    @chatroom.destroy
    redirect_to chatrooms_url, notice: 'Chatroom was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end
