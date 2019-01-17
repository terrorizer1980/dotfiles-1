module Dotfiles
  module Links
    def link_dotfiles
      home = ENV["HOME"]

      core_runcoms.each { |f| link_file(f) }

      link_file("config/Brewfile", "$HOME", false)
      link_file("config/hushlogin", "$HOME", false)
      link_file("config/macos", "$HOME", false)

      link_file("zsh/zlogin")
      link_file("zsh/zlogout")
      link_file("zsh/zpreztorc")
      link_file("zsh/zshenv")
      link_file("zsh/zshrc")

      link_emacs
      link_git
      link_neovim
      link_vim
      link_vscode
    end

    def link_file(file, location = "$HOME", dot = true)
      outfile = file.split("/").last
      dot && outfile = ".#{outfile}"
      run %{ln -nfs #{DOTFILES_DIR}/#{file} #{location}/#{outfile}}
    end

    private

    def core_runcoms
      [
        "config/agignore",
        "config/ctags",
        "config/editorconfig",
        "config/npmrc",
        "config/pryrc",
        "config/rubocop.yml",
        "config/tmux.conf",
        "config/tool-versions"
      ]
    end

    def link_emacs
      return unless user_wants?("Emacs", false)
      run %{ln -nfs #{DOTFILES_DIR}/emacs $HOME/.doom.d}
    end

    def link_git
      return unless user_wants?("Git", true)
      link_file("git/gitconfig")
      link_file("git/gitignore_global")
    end

    def link_neovim
      return unless user_wants?("Neovim", true)
      run %{ln -nfs #{DOTFILES_DIR}/nvim $HOME/.config/nvim}
      link_file("init.vim", "$HOME/.config/nvim", false)
    end

    def link_vim
      return unless user_wants?("Vim", false)
      link_file("vimrc")
    end

    def link_vscode
      return unless user_wants?("Visual Studio Code", true)
      run %{while read l; do code --install-extension $l; done < vscode/extensions.manifest}
      link_file("vscode/snippets", "$HOME/Library/Application\\ Support/Code/User/snippets", false)
      link_file("vscode/settings.json", "$HOME/Library/Application\\ Support/Code/User", false)
      link_file("vscode/keybindings.json", "$HOME/Library/Application\\ Support/Code/User", false)
    end
  end
end
