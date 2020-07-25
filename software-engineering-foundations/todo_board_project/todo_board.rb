require_relative "list"

class TodoBoard

  def initialize(label = "no label")
    @list = List.new(label)
  end

  def get_command
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')

    case cmd
    when 'mktodo'
      @list.add_item(*args)
    when 'up'
      args.map! { |arg| arg.to_i }
      @list.up(*args)
    when 'down'
      args.map! { |arg| arg.to_i }
      @list.down(*args)
    when 'swap'
      args.map! { |arg| arg.to_i }
      @list.swap(*args)
    when 'sort'
      @list.sort_by_date!
    when 'priority'
      @list.print_priority
    when 'print'
      puts "args.length is #{args.length}"
      print args
      print "\n"
      args.length > 0 ? @list.print_full_item(args[0].to_i) : @list.print
    when "quit"
      return false
    else 
      puts "Sorry, that command is not recognized."
    end

    true
  end
end