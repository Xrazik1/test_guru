# frozen_string_literal: true

class GistQuestionService

  def initialize(question)
    @question = question
    @test = question.test
    @client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
    @last_response = @client.last_response
  end

  def success?
    @last_response.status == 201
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
