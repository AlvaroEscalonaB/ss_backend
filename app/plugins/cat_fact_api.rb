class CatFactApi
  API_URL = 'https://catfact.ninja/fact'

  def self.get
    response = HTTParty.get(API_URL)
    return false if response.code != 200
    JSON.parse(response.body).to_h.slice("fact")
  end

end