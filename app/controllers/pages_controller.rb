# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_owner, only: [:home]
  def home; end

  def contact; end

  def terms; end

  def privacy; end
end
