# インストールしたcapistranoのバージョンを「cap -V」コマンドで確認、指定する。
# lock '3.2.1'

set :application, 'hook' # アプリケーション名
set :repo_url, 'git@github.com:longtajl/hookserver.git' # レポジトリのSSH clone URL
set :branch, 'master' # デプロイしたいブランチ名
set :deploy_to, '/var/www/vhosts/sinatra' # デプロイ先サーバのディレクトリ
set :scm, :git
set :log_level, :debug
set :pty, true
#set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5

#after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  task :restart do
    run "if [ -f #{unicorn_pid} ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{current_path} && bundle exec unicorn -c #{unicorn_conf} -E #{rack_env} -D; fi"
  end

  task :start do
    run "cd #{current_path} && bundle exec unicorn -c #{unicorn_conf} -E #{rack_env} -D"
  end

  task :stop do
    run "if [ -f #{unicorn_pid} ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

end
