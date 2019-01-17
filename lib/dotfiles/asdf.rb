module Dotfiles
  module Asdf
    def install_asdf_plugins
      run %{asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git}
      run %{asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git}
      run %{asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git}
      run %{asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git}
      run %{asdf plugin-add python https://github.com/tuvistavie/asdf-python.git}
    end

    def install_asdf_versions
      if user_wants?("Node.js release team", true, "OpenPGP keys")
        kill_gpg_agent
        run %{$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring}
      end

      run %{export KERL_CONFIGURE_OPTIONS="--without-javac"}
      run %{asdf install}
    end

    private

    def kill_gpg_agent
      `ps cax | grep gpg-agent > /dev/null`
      return unless $?.success?
      run %{pkill -9 gpg-agent}
    end
  end
end
