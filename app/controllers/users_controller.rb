class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    if @user.email == 'test@test.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    else
      @user.update(is_deleted: true)
      #ログアウトさせる
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    end
  end

  def edit

  end
  
end
