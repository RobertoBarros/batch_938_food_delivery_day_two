class OrdersView
  def ask_index
    puts "index?"
    gets.chomp.to_i - 1
  end

  def display_riders(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1} - Rider: #{employee.username}"
    end
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - Meal: #{order.meal.name} | Customer: #{order.customer.name} | Address: #{order.customer.address} | Delivered by: #{order.employee.username}"
    end
  end
end
