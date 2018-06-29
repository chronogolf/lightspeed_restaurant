# frozen_string_literal: true

class FakeLogger
  attr_reader :errors, :infos

  def initialize
    @errors = []
    @infos = []
  end

  def info(*_args)
    @infos << yield.to_s
  end

  def error(*_args)
    @errors << yield.to_s
  end
end
