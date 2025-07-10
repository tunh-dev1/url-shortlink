require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "POST /encode" do
    let(:original_url) { 'https://example.com' }

    context "when URL already exists" do
      let!(:url) { Url.create!(original_url: original_url, shorted_url: 'aaa111') }

      it "returns existing shorted URL" do
        post "/encode", params: { original_url: original_url }, as: :json
        expect(response).to have_http_status(:created)

        json = JSON.parse(response.body)
        expect(json['shorted_url']).to eq('aaa111')
        expect(json['original_url']).to eq(original_url)
        expect(json['message']).to eq('Created Short URL Successfully!')
      end
    end

    context "when URL does not exist" do
    it "creates a new shorted URL" do
      expect {
        post "/encode", params: { original_url: original_url }, as: :json
      }.to change(Url, :count).by(1)

      expect(response).to have_http_status(:created)

      json = JSON.parse(response.body)
      expect(json['original_url']).to eq(original_url)
      expect(json['message']).to eq('Created Short URL Successfully!')

      expect(json['shorted_url'].length).to eq(6)

      url = Url.last
      expect(url.original_url).to eq(original_url)
      expect(url.shorted_url).to eq(json['shorted_url'])
    end
  end

  end

  describe "GET /decode" do
    context "when shorted_url exists" do
      let!(:url) { Url.create!(original_url: 'https://example.com', shorted_url: 'cccc33') }

      it "returns the original URL" do
        get "/decode/cccc33", as: :json
        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)
        expect(json['original_url']).to eq('https://example.com')
        expect(json['message']).to eq('Decode URL Successfully!')
      end
    end

    context "when shorted_url does not exist" do
      it "returns not found error" do
        get "/decode/notfound", as: :json
        expect(response).to have_http_status(:not_found)

        json = JSON.parse(response.body)
        expect(json['error']).to eq('shorted URL not found')
      end
    end
  end

end