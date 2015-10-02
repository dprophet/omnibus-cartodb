name 'cartodb'

dependency 'grunt-cli'
dependency "cartodb-npm"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  
  # install development and test dependecies for grunt work...
  staging_dir = "#{install_dir}/embedded/cartodb"
  
  command 'npm install -d',          cwd: staging_dir, env: env
  command 'npm install grunt-timer', cwd: staging_dir, env: env

  command 'grunt', env: env.merge({
     "LC_ALL" => "en_US.UTF-8",
     "LANG" => "en_US.UTF-8"
  })
end
