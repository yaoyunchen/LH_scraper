require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'pry'

require_relative 'comment'
require_relative 'post'
require_relative 'scraper'

class Main

  def initialize
    argv_menu
  end

  def argv_menu
    if ARGV[0] == nil
      instantiate_post(get_user_input("URL"))
      main_menu
    else
      instantiate_post(ARGV[0])
      if ARGV[1] == nil
        main_menu
      else
        determine_action(ARGV[1])
      end
    end
  end

  def main_menu
    puts "Here is a list of available commands:
      info        - show post info
      comments    - show all comments"
    determine_action($stdin.gets.chomp)
  end

  #Instantiates the post object.
  def instantiate_post(input)
    begin
      raise NoURLError if input == ""
      @post = Scraper.get_post_info(input)
    rescue NoURLError
      puts "No URL specified."
      exit
    end
  end


  #Determine what the user wants to do with the information.
  def determine_action(input)
    case input
      when "info"
        show_post_info 
      when "comments"
        show_all_comments
    end
  end


  #Prompts for and gets user input.
  def get_user_input(input)
    puts "Please enter #{input}."
    gets.chomp
  end

  #Displays the post info.
  def show_post_info
    puts @post.show_info
  end

  #Displays all comments for the post.
  def show_all_comments
    puts @post.comments
  end

  class NoURLError < StandardError
  end

  Main.new
end



