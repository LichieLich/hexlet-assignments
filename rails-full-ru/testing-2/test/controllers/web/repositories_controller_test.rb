# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  def test_should_create_repo
    response_body = load_fixture('files/response.json')
    mocked_json_response = JSON.parse(response_body)

    stub_request(:get, /github.com/)
      .to_return(body: response_body, headers: {content_type: 'application/json'})
    repo = post repositories_path(repository: { link: mocked_json_response['html_url'] })

    created_repo = Repository.find_by!(
      link: mocked_json_response['html_url'],
      owner_name: mocked_json_response['owner']['login'],
      repo_name: mocked_json_response['full_name'],
      description: mocked_json_response['description'],
      default_branch: mocked_json_response['default_branch'],
      watchers_count: mocked_json_response['watchers_count'],
      language: mocked_json_response['language']
    )

    assert created_repo
  end
  # END
end
