class PostCommentsController < ApplicationController

	def create
    post_image = PostImage.find(params[:post_image_id])#画像個別データ受信

		comment = PostComment.new(post_comment_params)#ストパラ使用で変数作成
		comment.user_id = current_user.id#ログイン中user情報をcommentのuser_idにする

    comment.post_image_id = post_image.id#画像データのidをcommentのpost_image_idにする(紐づけ)
    comment.save
    redirect_to post_image_path(post_image)
	end

	def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
	end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
