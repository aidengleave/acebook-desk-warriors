class MessgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messges = Messge.all
    @messge = Messge.new
  end

  def create
    @messge = Messge.new(messge_params)
    @messge.user = current_user
    @messge.save
  end

  private

  def messge_params
    params.require(:messge).permit(:body)
  end
end
