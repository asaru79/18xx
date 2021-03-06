# frozen_string_literal: true

require_relative 'game_error'

module Engine
  module Spender
    attr_accessor :cash

    def check_cash(amount)
      raise GameError, "#{name} has #{@cash} and cannot spend #{amount}" if (@cash - amount).negative?
    end

    def spend(cash, receiver)
      check_cash(cash)
      @cash -= cash
      receiver.cash += cash
    end
  end
end
