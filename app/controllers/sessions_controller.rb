require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    # 1. Perguntar o username
    username = @view.ask_username

    # 2. Perguntar o password
    password = @view.ask_password

    # 3. Encontrar o employee pelo username
    employee = @employee_repository.find_by_username(username)

    # 4. Verificar se o employee existe e se existir se o password está correto
    if employee && employee.password == password
      @view.welcome(employee)
    else
      @view.wrong_credentials
      login
    end
    employee
  end
end
