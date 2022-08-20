require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # 1. Perguntar o nome da customer
    name = @view.ask_name
    # 2. Perguntar o endereço da customer
    address = @view.ask_address

    # 3. Instanciar uma nova customer
    customer = Customer.new(name: name, address: address)

    # 4. Adicionar a customer no repositório
    @customer_repository.create(customer)
  end

  def list
    # 1. Pegar todas as instâncias de customer do repositório
    customers = @customer_repository.all
    # 2. Mandar a view exibir os dados das customers
    @view.display(customers)
  end
end
