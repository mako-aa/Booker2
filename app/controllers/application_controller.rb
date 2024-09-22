class ApplicationController < ActionController::Base
    
    #devise利用の機能が使われる前にこのメソッドが実行
    #ユーザー登録の際にnameのデータ操作を許可
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    #サイン後の遷移ページ
    def after_sign_in_path_for(resource)
        books_path
    end
    
    #サインアウト後の遷移ページ
    def after_sign_out_path_for(resource)
        homes_top_path
    end
  
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end 
end
