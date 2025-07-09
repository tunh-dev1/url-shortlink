class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :encode
  def encode
    url_record = Url.find_by(original_url: params[:original_url])
    shorted_url = ""

    if url_record
      shorted_url = url_record.shorted_url
    else
      service = UrlService.new(params[:original_url])
      shorted_url = service.encode
    end

    render json: { original_url: params[:original_url], shorted_url: shorted_url, message: "Created Short URL Successfully!" }, status: :created
  end

  def decode
    service = UrlService.new
    original_url = service.decode(params[:shorted_url])

    if original_url
      render json: { original_url: original_url , message: "Decode URL Successfully!"}, status: :ok
    else
      render json: { error: 'shorted URL not found' }, status: :not_found
    end
  end
end
