require 'rails_helper'

RSpec.describe "HashTags", type: :request do
  describe "GET /hash_tags" do
    it "works! (now write some real specs)" do
      get hash_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
