class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
    @badge.category = Category.first
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    error = check_params
    if !error.to_s.empty?
      flash.now[:alert] = error
      render :new
      return
    end

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    error = check_params
    if !error.to_s.empty?
      flash.now[:alert] = error
      render :edit
      return
    end

    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  private

  def badge_params
    current_params = params.require(:badge).permit(:name, :rule, :level)
    result = { name: current_params[:name],
               category_id: nil,
               first_attempt: nil,
               level: nil
             }

    if current_params[:rule] == 'level'
      result[:level] = current_params[:level]
    elsif current_params[:rule] == 'first_attempt'
      result[:first_attempt] = true
    elsif current_params[:rule].to_i > 0
      result[:category_id] = current_params[:rule].to_i
    end

    result
  end
  
  def set_badge
    @badge = Badge.find(params[:id])
  end

  def check_params
    current_params = params.require(:badge).permit(:name, :rule, :level)

    return t('.rule_error') if current_params[:rule].nil?
    return t('.level_error') if current_params[:rule] == 'level' && current_params[:level].to_i == 0
  end

end
