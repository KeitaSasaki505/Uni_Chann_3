class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

# ゲストユーザー削除防止
  def withdrawal
    @user = User.find(params[:id])
    if current_user.email == 'test@test.com'
      redirect_to root_path, alert: "ゲストユーザーは退会できません。"
    else
      #is_deletedカラムにフラグを立てる(defaultはfalse)
      @user.update(is_deleted: true)
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    end
  end

end