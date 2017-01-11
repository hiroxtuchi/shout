class AfterLogInProsessController < ApplicationController
  before_action :login_check, only: :shout

 def choused
 end

 def shout
   @user = ShoutList.new
 end

 def shout_aftre
 end

 def watch_shout
      @shout = ShoutList.where(:user_id => current_user.id).reverse
 end

  def find_user
    @q = User.search
  end

 def find_user_result
   @q = User.search(params[:q])
   @users = @q.result(distinct: true)
 end

 def find_user_detail
   @user_info = User.find_by(:id => params[:id])
   @user_shout = ShoutList.where(:user_id =>params[:id])
 end


 def resp_shout
   @un_resp = ShoutList.get_unresp_shout(params[:id].to_i)
   @resp_info = ShoutList.new
 end

 def register_resp
    resp_shout = ShoutList.new(resp)
    #:shout=返信内容、:user_id=返信者のuser_id, :id=返信対象となるshoutのid
    resp_shout=ShoutList.new(
                     :shout => resp[:shout], :user_id => resp[:user_id],
                      :resp_shout => resp[:id]
                     )
    resp_shout.save
    redirect_to :action => "watch_shout"
 end

 def watch_resp_shout
   @un_resp = ShoutList.get_unresp_shout(params[:id].to_i)
   @resp = ShoutList.where(:resp_shout => params[:id].to_i)
 end

 def follow_user
   user = User.find_by(:id => params[:user_id].to_i)
  if user.follow_lists.create(:user_id => params[:user_id].to_i, :follow_id => params[:follow_id].to_i)
    flash[:follow_user_result] = 'フォローしました。'
  else
    flash[:follow_user_result] = 'フォローできませんでした。もう一度お願いします。'
  end
  redirect_to :back
 end
private

def resp
  params.require(:shout_list).permit(:shout, :user_id, :id)
end

end
