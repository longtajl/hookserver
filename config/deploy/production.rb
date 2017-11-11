set :rails_env, "production"
set :unicorn_rack_env, "production"

role :app, %w{v150-95-156-179.a095.g.tyo1.static.cnode.io} # ホスト名

server 'v150-95-156-179.a095.g.tyo1.static.cnode.io', user: 'shota', roles: %w{app} # ホスト名, ユーザ名

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}
