class MatchesController < ApplicationController
    def index
        @matches = Match.all.paginate(page: params[:page],per_page: 6)
    end

    def show
        @match = Match.find(params[:id])
    end
     
    def new
        if signed_in?
            @match = Match.new
        else 
            restrict_access
        end
    end

    def create
        @match = Match.new(match_params)
 
        if @match.save
            redirect_to matches_path
        else
            render 'new'
        end
        
    end

    def restrict_access
        redirect_to root_path
    end

    private
        def match_params
            params.require(:match).permit(:player_1_id, :player_2_id, :player_3_id, :player_4_id, :player_1_score, :player_2_score, :player_3_score, :player_4_score, :league_id)
        end
end
