module Dotfiles
  module Asdf
    def install_asdf_plugins 
      run %{asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git || true}
      run %{asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git || true}
      run %{asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git || true}
      run %{asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true}
      run %{asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git || true}
      run %{asdf plugin-add python https://github.com/tuvistavie/asdf-python.git || true}
    end

    def install_asdf_versions
      run %{bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring}
      run %{export KERL_CONFIGURE_OPTIONS="--without-javac"}
      run %{asdf install}
    end
  end
end