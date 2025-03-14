namespace :active_admin do
  desc "Build Active Admin Tailwind stylesheets"
  task build: :environment do
    command = [
      "tailwindcss",
      "-i", Rails.root.join("app/assets/stylesheets/active_admin.css").to_s,
      "-o", Rails.root.join("app/assets/builds/active_admin.css").to_s,
      "-c", Rails.root.join("config/tailwind-active_admin.config.js").to_s
    ]

    system(*command, exception: true)
  end

  desc "Watch Active Admin Tailwind stylesheets"
  task watch: :environment do
    command = [
      "tailwindcss",
      "--watch",
      "-i", Rails.root.join("app/assets/stylesheets/active_admin.css").to_s,
      "-o", Rails.root.join("app/assets/builds/active_admin.css").to_s,
      "-c", Rails.root.join("config/tailwind-active_admin.config.js").to_s
    ]

    system(*command)
  end
end

Rake::Task["assets:precompile"].enhance([ "active_admin:build" ])

Rake::Task["test:prepare"].enhance([ "active_admin:build" ]) if Rake::Task.task_defined?("test:prepare")
Rake::Task["spec:prepare"].enhance([ "tailwindcss:build" ]) if Rake::Task.task_defined?("spec:prepare")
Rake::Task["db:test:prepare"].enhance([ "tailwindcss:build" ]) if Rake::Task.task_defined?("db:test:prepare")
