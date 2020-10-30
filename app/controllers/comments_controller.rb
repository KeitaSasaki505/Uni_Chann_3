class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [ ]
  before_action :set_comment, only: [ ]

  def create
  end




