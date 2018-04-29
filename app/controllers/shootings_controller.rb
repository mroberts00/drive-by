class ShootingsController < ApplicationController
  
  before_action :set_shooting, only: [:show, :edit, :update, :destroy]

  # GET /shootings
  # GET /shootings.json
  def index
    @shootings = Shooting.all
  end

  # GET /shootings/1
  # GET /shootings/1.json
  def show
    @shooting = Shooting.find(params[:id])
    @victims = @shooting.victims
  end

  # GET /shootings/new
  def new
    @shooting = Shooting.new
  end

  # GET /shootings/1/edit
  def edit
  end

  # POST /shootings
  # POST /shootings.json
  def create
    gun = Madlibs::Madlib.new('<gun>', { "guns" => ["rocket launcher", "Uzi", "sawed-off shotgun", "Blunderbuss", "M45 Tactical Shotgun", "M82 Assault Rifle", "Particle Cannon", "Pulse rifle", "Phaser", "Railgun", "Sub-Atomic Neutrodestabilizer", "Tesla Gun", "Widowmaker", "CZ53 personal minigun", "Glock 7", "Golden Gun", "Moonraker Lazer", "silenced PP7", "grenade launcher"]})
    car = Madlibs::Madlib.new('<car>', { "cars" => ["Tesla Model 3", "Morris Minor", "Aston Martin DB9", "Ford Pickup", "Ducati V4 Panigale", "VW Beetle", "Mini Cooper", "VW Combi", "Mitsubishi Delica", "American Schoolbus", "Lamborghini Diablo", "John Deer 5100MH Tractor", "Gibbs Humdinga Amphibious Vehicle", "Dodgem Car", "Sherman Crocodile Flamethrower Tank", "Mazda Titan Dump", "Honda Life Dunk", "Dodge Rampage", "Renault LeCar", "Red Bull F1 car"]})
    @shooting = Shooting.new(weapon: gun.generate, location: Faker::Address.community, vehicle: car.generate )


    respond_to do |format|
      if @shooting.save
        rand(3..5).times do
          @shooting.victims.create(name: Faker::Name.name, age: rand(2..107), dead: Faker::Boolean.boolean(0.7))
        end
        format.html { redirect_to @shooting, notice: 'Shooting was successfully created.' }
        format.json { render :show, status: :created, location: @shooting }
      else
        format.html { render :new }
        format.json { render json: @shooting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shootings/1
  # PATCH/PUT /shootings/1.json
  def update
    respond_to do |format|
      if @shooting.update(shooting_params)
        format.html { redirect_to @shooting, notice: 'Shooting was successfully updated.' }
        format.json { render :show, status: :ok, location: @shooting }
      else
        format.html { render :edit }
        format.json { render json: @shooting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shootings/1
  # DELETE /shootings/1.json
  def destroy
    @shooting.destroy
    respond_to do |format|
      format.html { redirect_to shootings_url, notice: 'Shooting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shooting
      @shooting = Shooting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shooting_params
      params.require(:shooting).permit(:weapon, :location, :vehicle)
    end




end
