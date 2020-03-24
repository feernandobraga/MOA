class MembersController < ApplicationController


  def index
    @members = Member.all.where(authorized_for_app: true)
  end


  #@members = Member.all.where(authorized_for_app: false)

end
