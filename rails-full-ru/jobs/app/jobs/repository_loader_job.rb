# frozen_string_literal: true

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(link)
    repository = Repository.find_by(link:) || Repository.new(link:)
    repository.start_fetching

    repo_name = link.gsub('https://github.com/', '')
    repository.repo_name = repo_name

    client = Octokit::Client.new

    repo = client.repository repo_name
    repository.owner_name = repo.owner.login
    repository.description = repo.description
    repository.default_branch = repo.default_branch
    repository.watchers_count = repo.watchers_count
    repository.language = repo.language

    if repository.save
      repository.fetching_complete!
    else
      repository.fail!
    end
  end
end
