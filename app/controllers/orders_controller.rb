require_relative '../views/orders_view'

class OrdersController

  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new

  end

  def add
    # 1. Encontrar um meal escolhido pelo manager
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @view.ask_index
    meal = meals[index]


    # 2. Encontrar um customer escolhido pelo manager
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @view.ask_index
    customer = customers[index]

    # 3. Encontrar um employee rider escolhido pelo manager
    employees = @employee_repository.all_riders
    @view.display_riders(employees)
    index = @view.ask_index
    employee = employees[index]


    # 4. Criar uma instância de order
    order = Order.new(meal: meal, customer: customer, employee: employee)

    # 5. Adicionar a order ao repositório
    @order_repository.create(order)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.display(orders)
    index = @view.ask_index
    order = orders[index]
    order.deliver!
    @order_repository.save_csv
  end

end
