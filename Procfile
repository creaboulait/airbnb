release:       ./release-tasks.sh
worker:        env QUEUE=* bundle exec rake sidekiq:work
urgentworker:  env QUEUE=urgent bundle exec rake sidekiq:work