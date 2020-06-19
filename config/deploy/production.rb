server '52.68.169.229', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yotanaka/.ssh/id_rsa'