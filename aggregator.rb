require 'rubygems'
require 'sinatra'
require 'httparty'
require 'pry'
post '/perform' do
	operands = params[:operands] 
	operator = params[:operator]
	aggregator = Aggregate.new(operator,operands).perform

	aggregator.result.to_s
end


class Aggregate
   attr_reader :operator,:operands,:result 
   def initialize(operation,operands)
    	@operator = operation
    	@operands = operands
   end

   def perform
   	@result = send(operator.to_sym)
   	log_history
   	self
   end

   private	

   def plus
   	 build_params
   	 HTTParty.post('http://192.168.99.208:4567/perform',body: build_params).body
   end
   alias_method :+,:plus

   def minus
   	  # HTTParty.post(,body: build_params)
   end
   alias_method :-,:minus
   
   def division
   		# HTTParty.post(,body: build_params)
   end
   alias_method :/,:division

   def multiply
   	  binding.pry
   		HTTParty.post('http://192.168.99.114:5000/perform',body: build_params)
   end
   alias_method :*,:multiply

   def build_params
   	 {"operands" => operands}
   end

   def log_history
   	  params = {expression: build_expression,result: result}
      HTTParty.post('http://192.168.99.114:4567',body: params)
   end

   def build_expression
   	  binding.pry
   		operands.collect(&:to_s).join(operator)
   end	
end


