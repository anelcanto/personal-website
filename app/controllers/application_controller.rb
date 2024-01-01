# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_owner

  def set_owner
    @owner = User.owner
  end
end
