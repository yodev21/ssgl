server '18.180.228.184', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yotanaka/.ssh/id_rsa'