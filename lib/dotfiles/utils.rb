module Dotfiles
  module Utils
    def create_dir(dir)
      `file #{dir}`
      unless $?.success?
        run %{mkdir -p #{dir}}
      end
    end

    def intro(text)
      div = ""
      40.times { div += "-" }
      out = "#{div}\n#{text}\n#{div}".colorize(:magenta)
      puts out
    end

    def outro(text)
      out = "\n ✔ ".colorize(:green)
      out += "#{text}\n\n"
      puts out
    end

    def run(cmd)
      out = "=> ".colorize(:blue)
      out += "[Running] ".colorize(:yellow)
      out += cmd
      puts out
      `#{cmd}` unless dry_run?
    end

    def dry_run?
      ENV["DRY_RUN"] == "true"
    end

    def install_config?(program)
      return true if ENV["ASK"] == "false"
      return true if override?(program)

      out = " ? ".colorize(:blue)
      out += "Install configuration files for #{program}? ".colorize(:cyan)
      out += "[y]es/[n]o ".colorize(:light_black)
      print out
      
      STDIN.gets.chomp == 'y'
    end

    def override?(section)
      section =
        case section
        when "Visual Studio Code"
          "VSCODE"
        when "Node.js"
          "NODEJS"
        else
          section.upcase
        end

      ENV[section] == "true"
    end
  end
end