class UsersController < ApplicationController
  def show
    @messages = current_user.messages
  end
end
