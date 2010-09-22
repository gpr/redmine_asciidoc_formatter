require 'open3'

class AsciiDoc
  
  @@asciidoc = "asciidoc -a toc -a icons -a iconsdir='/redmine/images/icons' -a '/redmine/images' -s"
  
  # Takes a string or file path plus any additional options and converts the input.
  def self.to_html(*args)
    new(*args).to_html
  end
  
  # Takes a string or file path plus any additional options and creates a new converter object.
  def initialize(*args)
    target = args.shift
    @target  = File.exists?(target) ? File.read(target) : target rescue target
    @options = args
  end
    
  # Converts the object's input to HTML.
  def to_html(*args)
    # @options += args
    command = "#@@asciidoc #@options -"
    execute command
  end
  
protected
  
  def execute(command)
    output = ''
    Open3::popen3(command) do |stdin, stdout, stderr| 
      stdin.puts @target 
      stdin.close
      output = stdout.read.strip 
    end
    output
  end

end

