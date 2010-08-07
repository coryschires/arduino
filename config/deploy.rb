set :application, "arduino"
set :repository,  "git@github.com:coryschires/arduino.git"

set :scm, :git # use git for version controll

set :user, 'coryandrob'  # Your dreamhost account's username
set :domain, 'ps14506.dreamhost.com'  # Dreamhost servername where your account is located 
set :project, 'arduino'  # Your application as its called in the repository
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup

role :web, "arduino.coryschires.com" # Your HTTP server, Apache/etc
role :app, "arduino.coryschires.com" # This may be the same as your 'Web' server
role :db,  "arduino.coryschires.com", :primary => true # This is where Rails migrations will run

# deploy config
set :deploy_to, "/home/coryandrob/arduino.coryschires.com/"
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # forgo errors when deploying from windows
ssh_options[:keys] = %w(/home/coryandrob/.ssh) # If you are using ssh_keys
set :use_sudo, false 
set :scm_passphrase, "binary1001"

set :deploy_via, :remote_cache
set :branch, 'master'
set :scm_verbose, true

namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end