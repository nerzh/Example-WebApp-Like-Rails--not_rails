workers 2
threads 1, 6

app_dir = '/var/www/megatron/data/codebreaker.inclouds.com.ua'

shared_dir = "#{app_dir}/shared"

# rails_env = ENV['RAILS_ENV'] || "production"

# rails_env = "production"

# environment rails_env

bind "unix://#{shared_dir}/puma.sock"

stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

on_worker_boot do
  # require "active_record"
  # ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  # ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end

activate_control_app
