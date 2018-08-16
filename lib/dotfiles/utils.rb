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
      40.times { div << "-" }
      out = "#{div}\n#{text}\n#{div}".colorize(:magenta)
      puts out
    end

    def outro(text = "Done")
      out = "\n ✔ ".colorize(:green)
      out << "#{text}\n\n"
      puts out
    end

    def run(cmd)
      print "\033[0m"
      out = "=> ".colorize(:blue)
      out << "[Running] ".colorize(:yellow)
      out << cmd
      puts out
      print "\033[90m"
      system(cmd) unless dry_run?
    end

    def run_output(cmd, status, done = false)
      out = "=> ".colorize(:blue)
      out << "[#{status}] ".colorize(:yellow)
      out << cmd
      out << if done then "\n" else "\r" end
      print out
    end

    def dry_run?
      ENV["DRY_RUN"] == "true"
    end

    def user_wants?(key, default, what = "configuration files")
      user_var = env_var(key)
      if user_var == "true"
        true
      elsif user_var == "false"
        false
      else
        get_user_choice(default, what, key)
      end
    end

    def env_var(key)
      key =
        case key
        when "Visual Studio Code"
          "VSCODE"
        when "Node.js"
          "NODEJS"
        when "Node.js release team’s"
          "NODEJS_PGP"
        else
          key.upcase
        end

      ENV[key]
    end

    def get_user_choice(default, what, key)
      choices = if default then "(Y/n) " else "(y/N) " end

      out = " ? ".colorize(:blue)
      out << "Install #{what} for #{key}? ".colorize(:cyan)
      out << choices.colorize(:light_black)
      print out

      input = STDIN.gets.chomp
      if default
        if input == "n" then false else true end
      else
        if input == "y" then true else false end
      end
    end
  end
end
