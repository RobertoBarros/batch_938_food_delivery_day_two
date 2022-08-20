require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # 1. Perguntar o nome da meal
    name = @view.ask_name
    # 2. Perguntar o preço da meal
    price = @view.ask_price

    # 3. Instanciar uma nova meal
    meal = Meal.new(name: name, price: price)

    # 4. Adicionar a meal no repositório
    @meal_repository.create(meal)
  end

  def list
    # 1. Pegar todas as instâncias de meal do repositório
    meals = @meal_repository.all
    # 2. Mandar a view exibir os dados das meals
    @view.display(meals)
  end

end
