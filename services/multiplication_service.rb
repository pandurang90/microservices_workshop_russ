require 'rubygems'
require 'sinatra'


post '/perform' do
  MultiplicationService.new(params[:operands]).perform
end

class MultiplicationService
	attr_accessor :operands

	def initialize(operands)
		@operands = operands.map(&:to_i)
	end

	def perform
		@operands.inject(:*)
	end
end