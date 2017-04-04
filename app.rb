require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name].reverse
    "#{@name}"
  end

  get '/square/:number' do
    @square_of_number = params[:number].to_i**2
    "#{@square_of_number}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    @number.times do
      "#{@phrase}"
    end
    "#{@phrase}\n" * @number
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @sentence = params[:captures].join(" ")
    "#{@sentence}."
    # binding.pry
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    if @operation == "multiply"
     "#{@num1 * @num2}"
    elsif @operation == "subtract"
      "#{@num1 - @num2}"
    elsif @operation == "add"
      "#{@num1 + @num2}"
    else @operation == "divide"
      "#{@num1 / @num2}"
    end
    # binding.pry
    #
    # @operation = params[:captures].first
    # if @operation == "multiple"
  end
end
