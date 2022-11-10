class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[index], Recipe

    can %i[destroy show new create], Recipe, user: user
    can :show, Recipe, public: true

    can :add_ingredient, Recipe, user:
  end
end
