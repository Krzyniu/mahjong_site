class LeaguesController < ApplicationController

    def show
        @league = League.find(params[:id])
    end

    def new
        @league = League.new
    end

    def create
        @league = League.new(league_params)
 
        if @league.save
            redirect_to matches_path
        else
            render 'new'
        end
        
    end



    private
        def league_params
            params.require(:league).permit(:name, :start, :end)
        end
end
