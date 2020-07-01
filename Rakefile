require "rake"
require "fileutils"
require "pathname"

source_path = (Pathname(__dir__) + "lib").expand_path
$LOAD_PATH << source_path

DOTFILES_DIR = "$HOME/dotfiles"

require "dotfiles"
include Dotfiles::Utils
include Dotfiles::Links
include Dotfiles::Asdf
include Dotfiles::Packages

desc "Run all tasks (default)"
task :install do
  Rake::Task[:homebrew].execute
  Rake::Task[:dotfiles].execute
  Rake::Task[:directories].execute
  Rake::Task[:languages].execute
  Rake::Task[:packages].execute
  Rake::Task[:macos].execute

  puts ""
  puts "👨‍💻  Happy hacking!"
  puts "https://github.com/ngscheurich/dotfiles"
end

desc "Install system packages using Homebrew"
task :homebrew do
  intro("📦  System Packages")

  # Install Homebrew if needed
  `which brew`
  unless $?.success?
    run %{ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}
  end

  run %{brew update}
  run %{brew upgrade}
  run %{brew bundle}

  outro()
end

desc "Link config files to their appropriate system locations"
task :dotfiles do
  intro("⚙️  Dotfiles")

  # Download dotfiles if needed
  unless File.exists? File.join(ENV["HOME"], "dotfiles")
    run %{git clone git@github.com:ngscheurich/dotfiles.git $HOME/dotfiles}
  end

  link_dotfiles

  outro()
end

desc "Create common directories"
task :directories do
  intro("📁  Directories")

  create_dir("$HOME/bin")
  create_dir("$HOME/Screenshots")
  create_dir("$HOME/Workspace")

  outro()
end

desc "Install programming languages"
task :languages do
  intro("🤖  Languages")

  # Install asdf if needed
  `which asdf`
  unless $?.success?
    run %{git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1}
  end

  install_asdf_plugins
  install_asdf_versions

  outro()
end

desc "Install language packages"
task :packages do
  intro("🎁  Language Packages")

  elixir_packages
  nodejs_packages
  ruby_packages

  outro()
end

desc "Set macOS preferences"
task :macos do
  intro("🍎  macOS")

  run %{./.macos} if user_wants?("macOS", true, "preferences")

  outro()
end

task :default => :install
