# frozen_string_literal: true

# PeopleRepo is the Repository object for accessing People ES index
class PeopleRepo
  include Elasticsearch::Persistence::Repository

  def initialize(options = {})
    index options[:index] || 'people'
    es_host = ENV['ELASTICSEARCH_URL']
    client Elasticsearch::Client.new(host: es_host)
  end

  klass Person

  def serialize(document)
    document.attributes
  end
end
