require 'rubygems'
require 'sinatra'

post '/log_history' do
  LogHistory.new.perform(params[:expression], params[:result])
end

get '/' do
	"hello"
end

class LogHistory
	attr_accessor :logs

	def initialize
		@@logs ||= []
	end

	def perform(expression, result)
		@@logs << "#{expression} = #{result}"
	end

	def get_logs
		@@logs
	end

end

