# - - - MODULES OBJECTS - - - -

module Menu
  def menu 
     " Welcome to the TodoList Program!
      This menu will help you use the Task List System
      1) Add
      2) Show 
      Q) Quit "
  end  

  def show 
    menu 
  end  
end

module Promptable
  def prompt(message ='What would you like to do?', symbol = ':>')
    print message
    print symbol
    gets.chomp 
  end  
end



# - - - CLASS OBJECTS - - - -
class List
  attr_reader :all_tasks

  def initialize
    @all_tasks = []
  end

  def add(task)
    all_tasks << task
  end 

  def show 
    all_tasks.each {|task| puts task.description}
  end

end

class Task
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

# - - - - RUNNER  - - - -

if __FILE__ == $PROGRAM_NAME
  include Menu
  include Promptable

  my_list = List.new

   puts 'Please choose from the following list:'
   until ['q'].include?(user_input = prompt(show).downcase)
      case user_input
        when '1'
          my_list.add(Task.new(prompt('What is the task you would 
          like to accomplish?')))
        when '2'
          my_list.show
        else
          puts 'Sorry, I did not understand'   
      end
      prompt('Press enter to continue', '')
    end
    puts 'Outro - Thanks for using the menu system!'
end 










