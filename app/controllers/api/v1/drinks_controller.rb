class Api::V1::DrinksController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        render json: DrinkSerializer.new(Drink.all)
    end

    def create
        user = User.find_or_create_by(username: params[:username])
        drink = Drink.find_by(name: params[:drink])
        qty = params[:number_of_drinks]
        
        if drink.nil?
            render json: "This drink cannot be found."
        elsif user.total_caffeine + drink.caffeine * qty > 500
            render json: "This would put you over 500 mg of caffeine, you've already had #{user.total_caffeine} mg of caffeine."
        else
            UserDrink.create(user: user, drink: drink, quantity: qty)
            user.total_caffeine += drink.caffeine * qty
            user.save
            render json: "Your drink was logged, you had #{user.total_caffeine} mg of caffeine."
        end
    end

    def delete_user
        u = User.find(params[:id])
        if u
            u.destroy
            render json: "User deleted!"
        else
            render json: "user not found"
        end
    end

    def my_drinks
        user = User.find_by(username: params[:username])
        if user.nil?
            render json: "User cannot be found."
        else
            drinks = UserDrink.joins(:drink)
            .select("drinks.id, drinks.name, drinks.description, user_drinks.quantity")
            .where('user_drinks.user_id = ?', user.id)
            .references(:drink)
            .order(created_at: :desc)
            #drinks = drinks.tally
            render json: drinks
        end
    end

    def users
        users = User.all
        logger.info "users #{users.inspect}"
        render json: users 
    end

    def destroy
        user = User.find_by(username: params[:username])
        if user.nil?
            render json: "User cannot be found."
        else
            user.user_drinks.destroy_all
            user.total_caffeine = 0
            user.save
            render json: "Your caffeine total has been reset to zero."
        end
    end
end