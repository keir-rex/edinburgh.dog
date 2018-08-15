task :default => :watch

desc 'Cleanup generated files'
task :clean do
  sh 'rm -rf _site 3rdparty'
end

desc 'Build the site'
task build: [:clean] do
  sh 'grunt copy'
  jekyll :build
end

desc 'Deploy the site to s3'
task deploy: [:build] do
  s3 :push
end

desc 'Serve the site locally and watch for changes'
task watch: [:clean] do
  jekyll 'serve --watch --drafts'
end

def jekyll(command)
  with_bundler "jekyll #{command}"
end

def s3(command, options = '')
  with_bundler "s3_website #{command} #{options}"
end

def with_bundler(command)
  sh "bundle exec #{command}"
end