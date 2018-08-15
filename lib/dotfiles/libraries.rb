module Dotfiles
  module Libraries
    def elixir_libraries
      return unless install_libraries?("Elixir")

      run %{mix local.hex --force}
      run %{mix local.rebar --force}
      run %{mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force}
    end

    def nodejs_libraries
      return unless install_libraries?("Node.js")

      run %{npm config set scripts-prepend-node-path true}
      run %{npm install -g create-react-app}
      run %{npm install -g gatsby-cli}
      run %{npm install -g graphqurl}
      run %{npm install -g live-server}
      run %{npm install -g prettier}
      run %{npm install -g tern}
      run %{npm install -g tslint}
      run %{npm install -g typescript}
    end

    def ruby_libraries
      return unless install_libraries?("Ruby")

      run %{gem install bundler}
      run %{gem install pry}
      run %{gem install rails}
      run %{gem install tmuxinator}
    end

    private

    def install_libraries?(lang)
      return true if ENV["ASK"] == "false"
      return true if override?(lang)

      out = " ? ".colorize(:blue)
      out << "Install libraries for #{lang}? ".colorize(:cyan)
      out << "[y]es/[n]o ".colorize(:light_black)
      print out
      
      STDIN.gets.chomp == 'y'
    end
  end
end
