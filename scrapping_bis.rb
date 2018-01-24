require 'rubygems'
require 'nokogiri'
require 'restclient'
require 'open-uri'
require 'pry'
require "google_drive"
require "gmail"

# $town_hash = Hash.new # variable globale - crée un hash
#SPREADSHEET
session = GoogleDrive::Session.from_config("config.json")# Creates a session

$ws = spreadsheet = session.spreadsheet_by_title("Test Ruby Perso").worksheets.first# Get the spreadsheet by its title
# session.spreadsheet_by_key("ccc?1k06VahUI_BInhsw63cPVTUwuoYlq0B7s97dEurnbkPo").worksheets[0]

#Titles - non modifiables par le scrapping
$ws [1,1] = "Mairies"
$ws [1,2] = "Emails"

$ws.save

# Reloads the worksheet to get changes by other clients.
$ws.reload

# Load all data scrapped from site

# SCRAPPING
def all_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    links = page.css(".lientxt")
    links.each do |link|
     if link['href'].include?('95')
        get_the_email_of_a_townhall_from_its_webpage(link['href'])
        # town_hash.store("")
        # $town_hash[town_name] = 'town_email'
        # puts town_hash
     end
    end
end

def get_the_email_of_a_townhall_from_its_webpage(url)
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + url))
  elements = page.css('td p font')
  elements.each do |el|
    i = 2
    if el.text.include?('@')
      town_name = page.css('strong .lientxt4').inner_html
      town_email = el.text
      puts town_name
      puts town_email
      # Load all data scrapped from site
      ws[i,town_name]
      ws[i,town_email]
      ws.save
      ws.reload
      # i=+
    end
  end
end

all_urls_of_val_doise_townhalls


# remplir hash:
# array_of_h = []
# 	h = {}
# 	h["city"] = "Value"
# 	h["mail"] = "value@value.val"
# 	array_of_h << h
#
# 	# toutes ces lignes peuvent se résumer à :
# 		array_of_h << {"city" => "Value", "mail" => "value@value.val"}
#
# Remplir sheet :
# sheet = GoogleDrive::Session.from_config("config.json").spreadsheet_by_key(spreadsheet_key).worksheets[page]
# 	array_of_h.each_with_index { |h, i| sheet[i+1, 1], sheet[i+1, 2] = h["city"], h["mail"]}
