require 'rubygems'
require 'nokogiri'
require 'restclient'
require 'open-uri'
require 'pry'
require "google_drive"

town_hash = {name: "Mairies", email: "Email"}

# SCRAPPING
def all_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    links = page.css(".lientxt")
    links.each do |link|
     if link['href'].include?('95')
        get_the_email_of_a_townhall_from_its_webpage(link['href'])
     end
    end
end

def get_the_email_of_a_townhall_from_its_webpage(url)
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + url))
    elements = page.css('td p font')
    elements.each do |el|
      if el.text.include?('@')
          town_email = el.text
          puts town_email
          town_name = page.css('strong .lientxt4').inner_html
          puts town_name
          # town_hash.push(name = town_name)
      end
    end
  end

all_urls_of_val_doise_townhalls

#SPREADSHEET
session = GoogleDrive::Session.from_config("config.json")# Creates a session

ws = spreadsheet = session.spreadsheet_by_title("Test Ruby Perso").worksheets.first# Get the spreadsheet by its title
# Equiv :
# spreadsheet = session.spreadsheet_by_title("Test Ruby Perso")
# ws = spreadsheet.worksheets.first ou .worksheets[0]

# Could have been done with : ws = session.spreadsheet_by_key("ccc?1k06VahUI_BInhsw63cPVTUwuoYlq0B7s97dEurnbkPo").worksheets[0]

#Titles - non modifiables par le scrapping
ws [1,1] = "Mairies"
ws [1,2] = "Emails"

# Load all data scrapped from site

ws.save


# Reloads the worksheet to get changes by other clients.
ws.reload
