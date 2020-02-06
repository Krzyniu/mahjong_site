class LeaguesController < ApplicationController

    def index
        if signed_in?
            @leagues = League.all
            @users = User.all
            @matches = Match.all

            @league_scores=Hash.new(0)

            @scores = Hash.new(0)

            @leagues.each do |league|
                
                @scores.clear

                @matches.each do |match|
                    if match.league_id==league.id
                        @scores[match.player_1_id]+=match.player_1_score
                        @scores[match.player_2_id]+=match.player_2_score
                        @scores[match.player_3_id]+=match.player_3_score
                        @scores[match.player_4_id]+=match.player_4_score
                    end
                end
                
                @league_scores[league.id]=@scores.deep_dup.delete_if {|key, value| value == 0 }
            end
        else
            restrict_access
        end
    end

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
            params.require(:league).permit(:name, :image, :start, :end)
        end

end
