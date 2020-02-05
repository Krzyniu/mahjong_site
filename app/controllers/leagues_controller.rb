class LeaguesController < ApplicationController

    def show
        @league = League.find(params[:id])
    end

    def new
        if signed_in?
            restrict_access if current_user.is_admin != true 
            @league = League.new
        else 
            restrict_access
        end
    end

    def create
        @league = League.new(league_params)
 
        if @league.save
            redirect_to matches_path
        else
            render 'new'
        end
        
    end

    def restrict_access
        redirect_to root_path
    end

    private
        def league_params
            params.require(:league).permit(:name, :start, :end)
        end
end
