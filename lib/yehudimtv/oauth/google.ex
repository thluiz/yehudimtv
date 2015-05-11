defmodule Google do
  use OAuth2.Strategy
  alias OAuth2.Strategy.AuthCode

  def new() do
    config = Yehudimtv.Endpoint.config(:google_auth)

    OAuth2.new([
      strategy: __MODULE__,
      client_id: config[:client_id],
      client_secret: config[:client_secret],
      redirect_uri: config[:redirect],
      site: "https://accounts.google.com",
      authorize_url: "https://accounts.google.com/o/oauth2/auth",
      token_url: "https://accounts.google.com/o/oauth2/token"
    ])
  end

  def authorize_url!(params \\ []) do
    url = OAuth2.Client.authorize_url!(new(), params)
    "#{url}&scope=profile email"
  end

  def get_token!(params \\ [], _headers \\ []) do
    OAuth2.Client.get_token!(new(), params)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
                                                                                                      |> AuthCode.get_token(params, headers)
                                                                                                        end
end
