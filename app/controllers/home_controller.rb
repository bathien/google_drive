class HomeController < ApplicationController
  before_action :visitor, only: :index

  def index
    @products = Product.includes(:images).all
    @categories = Category.second
    @visitor_count = VisitorCountJob.perform_later
  end

  def contact
    customer = {name: params[:name], email: params[:email], phone: params[:phone]}
    ApplicationMailer.contact_me(params[:message], customer).deliver_now

  end

  private
  def visitor
     service_account_email = ENV["GOOGLE_SERVICE_EMAIL"]
    key_file = Rails.root.join("key", "keyfile.p12") # File containing your private key
    key_secret = "notasecret" # Password to unlock private key
    profileID = ENV["PROFILE_ID"] # Analytics profile ID.

    # Get the Google API client
    client = Google::APIClient.new(:application_name => "vavimex",
      :application_version => "0.01")

    # Load your credentials for the service account
    key = Google::APIClient::KeyUtils.load_from_pkcs12(key_file, key_secret)

    client.authorization = Signet::OAuth2::Client.new(
      :token_credential_uri => "https://accounts.google.com/o/oauth2/token",
      :audience => "https://accounts.google.com/o/oauth2/token",
      :scope => "https://www.googleapis.com/auth/analytics.readonly",
      :issuer => service_account_email,
      :signing_key => key)

    # Request a token for our service account
    client.authorization.fetch_access_token!

    # Get the analytics API
    analytics = client.discovered_api("analytics","v3")

    # Start and end dates
    startDate = DateTime.now.strftime("%Y-%m-01") # first day of current month
    endDate = DateTime.now.strftime("%Y-%m-%d")  # now

    # Execute the query
    visitCount = client.execute(:api_method => analytics.data.ga.get, :parameters => {
      "ids" => "ga:" + profileID,
      "start-date" => startDate,
      "end-date" => endDate,
      # "dimensions" => "ga:month",
      "metrics" => "ga:visitors",
      # "sort" => "ga:month"
    })
    @visitor_count = visitCount.data.rows[0][0].to_i
  end
end
