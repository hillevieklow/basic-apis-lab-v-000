class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'a56cd5478e70801435d8'
      req.params['client_secret'] = 'fab9934043c874b4d9f3a3a025c9fda4a6b99858'
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
