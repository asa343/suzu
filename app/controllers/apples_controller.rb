class ApplesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        if params[:search] == nil
          @apples= Apple.all
        elsif params[:search] == ''
          @apples= Apple.all
        else
          #部分検索
          search_term = '%' + params[:search] + '%'
          @apples = Apple.where("name LIKE ? OR relation LIKE ? OR kind LIKE ? OR about LIKE ? ", search_term, search_term, search_term, search_term)
        end

    end
    
    def new
        @apple = Apple.new
      end
    
      def create
        apple = Apple.new(apple_params)
        apple.user_id = current_user.id 
        if apple.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @apple = Apple.find(params[:id])
        @comments = @apple.comments
        @comment = Comment.new
      end
    
      def edit
        @apple = Apple.find(params[:id])
      end

      def update
        apple = Apple.find(params[:id])
        if apple.update(apple_params)
          redirect_to :action => "show", :id => apple.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        apple = Apple.find(params[:id])
        apple.destroy
        redirect_to action: :index
      end

      private
      def apple_params
        params.require(:apple).permit(:name, :relation, :kind, :about)
      end
    end
