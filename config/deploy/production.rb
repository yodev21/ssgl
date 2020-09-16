# frozen_string_literal: true

# SSGL-production
server '18.180.228.184', user: 'app', roles: %w[app db web]

# SSGL-production-ami
server '54.64.111.71', user: 'app', roles: %w[app db web]

set :ssh_options, keys: '/Users/yotanaka/.ssh/id_rsa'
