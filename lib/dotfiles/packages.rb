module Dotfiles
  module Packages
    def elixir_packages
      return unless user_wants?("Elixir", "packages")

      run %{mix local.hex --force}
      run %{mix local.rebar --force}
      run %{mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force}
    end

    def nodejs_packages
      return unless user_wants?("Node.js", "packages")

      run %{npm install -gs create-react-app}
      run %{npm install -gs gatsby-cli}
      run %{npm install -gs graphqurl}
      run %{npm install -gs live-server}
      run %{npm install -gs prettier}
      run %{npm install -gs tern}
      run %{npm install -gs tslint}
      run %{npm install -gs typescript}
    end

    def ruby_packages
      return unless user_wants?("Ruby", "packages")

      run %{gem install bundler}
      run %{gem install pry}
      run %{gem install rails}
      run %{gem install tmuxinator}
    end
  end
end
