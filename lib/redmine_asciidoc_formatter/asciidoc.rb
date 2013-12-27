require 'open3'

class AsciiDoc
  
  @@asciidoc = "asciidoc -a icons -a iconsdir='/redmine/images/icons' -a imagesdir='/redmine/images'"

  # Takes a string or file path plus any additional options and converts the input.
  def self.to_html(*args)
    new(*args).to_html
  end

  # Takes a string or file path plus any additional options and creates a new converter object.
  def initialize(*args)
    target = args.shift
    @target  = File.exists?(target) ? File.read(target) : target rescue target
  end
    
  # Converts the object's input to HTML.
  def to_html(*args)
    command = "#{@@asciidoc}"
    args.each do |arg|
        command += " #{arg}"
    end
    command += ' -'
    execute command
  end
  
protected
  
  def execute(command)
    output = ''
      Open3::popen3(command) do |stdin, stdout, stderr, wait_thr|
        stdin.puts @target
        stdin.close
        output = stdout.read.strip
        output = stderr.read.strip if output == ''
        exit_status = wait_thr.value
      end
    output
  end

end

