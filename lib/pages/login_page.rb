class LoginPage
  include PageObject

  #page_url 'http://en.wikipedia.beta.wmflabs.org/w/index.php?title=Special:UserLogin'
  page_url 'https://en.wikipedia.org/w/index.php?title=Special:UserLogin'
  text_field(:username, :id => 'wpName1')
  text_field(:password, :id => 'wpPassword1')
  button(:login, :id => 'wpLoginAttempt')
  link(:phishing, :link_text => "phishing")
  link(:password_strength, :link_text => "password strength")
  
  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end


