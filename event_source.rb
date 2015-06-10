require 'rubygems'
require 'sinatra'

post '/perform' do
  EventSource.new.perform({name: params[:name],
													description: params[:description],
													payload: params[:payload]})
end

class EventSource
	attr_accessor :event

	def initialize
		@@events ||= []
	end

	def perform(event_data)
		@@events << {name: event_data[:name],
								description: event_data[:description],
								payload: event_data[:payload],
								created_at: DateTime.now}
	end
end