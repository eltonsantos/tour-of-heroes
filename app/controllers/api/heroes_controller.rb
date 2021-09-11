class Api::HeroesController < ApplicationController

  include Authenticable

  # http_basic_authenticate_with name: Rails.application.credentials.authenticate[:name],
  #                              password: Rails.application.credentials.authenticate[:password],
  #                              except: %i[index show]

  before_action :authenticate_with_token
  before_action :set_hero, only: %i[ show update destroy ]

  # GET /heroes or /heroes.json
  def index
    @heroes = Hero.by_token(@token).search(params[:term]).sorted_by_name

    render json: @heroes
  end

  # GET /heroes/1 or /heroes/1.json
  def show
    render json: @hero
  end

  # POST /heroes or /heroes.json
  def create
    @hero = Hero.new(hero_params.to_h.merge!({ token: @token }))

    if @hero.save
      render json: @hero, status: :created, location: api_hero_url(@hero)
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heroes/1 or /heroes/1.json
  def update
    if @hero.update(hero_params)
      render json: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1 or /heroes/1.json
  def destroy
    @hero.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.by_token(token).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.require(:hero).permit(:name)
    end
end
