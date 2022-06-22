require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'

class ExtractedInfoController < ApplicationController

include HTTParty
default_options.update(verify: false)
    def index
     extract
    end

    def insertData
        render "test"
    end

    def extract
        @url = params[:url]
        expression = "((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)"
        if !@url.match(expression)
           abort("Wrong url provided")
        end
        unparsed_page = HTTParty.get(@url, :verify => false)
        parsed_page = Nokogiri::HTML(unparsed_page)
        parsedName = parsed_page.css('strong').children[1].text
    if parsedName.split(' ').count > 2 
            @firstname = parsedName.split(' ').first
            @lastname = parsedName.split[1,2].join(' ')
        
    else
        @firstname = parsedName.split(' ').first
        @lastname = parsedName.split(' ').last
    end
    
    if parsed_page.css('div.pd_bot').empty?
        @nativeLanguage = ""
    else
        if parsed_page.css('div.pd_bot').children.count < 3 
            @nativeLanguage = ""
        else
            @nativeLanguage = parsed_page.css('div.pd_bot').children[3].text.gsub(/\s+/, "").delete(":")
        end
    end
    languages = parsed_page.at_css('[id="lang_full"]')
    targetCount = 0
    @targetLanguages = ""
    while targetCount < languages.children.count do
        if @targetLanguages.empty?
            if !languages.children[targetCount].text.empty?
                @targetLanguages = languages.children[targetCount].text.split("to").first.strip
            end
        else
            if !languages.children[targetCount].text.empty?
                if languages.children[targetCount].text.strip == "Less"
                else
                     if languages.children[targetCount].text.strip == "More"
                     else
                        @targetLanguages = @targetLanguages + ", " + languages.children[targetCount].text.split("to").first.strip
                     end
                    
                end
            end
        end

        targetCount = targetCount + 1
    end

    languagesSum = parsed_page.at_css('[id="lang_sum"]')
    targetCountSum = 0
    if !!parsed_page.at_css('[id="lang_sum"]')
   
    while targetCountSum < languagesSum.children.count do
        if @targetLanguages.empty?
            if !languagesSum.children[targetCountSum].text.empty?
                @targetLanguages = languagesSum.children[targetCountSum].text.split("to").first.strip
            end
        else
            if !languagesSum.children[targetCountSum].text.empty?
                if languagesSum.children[targetCountSum].text.strip == "Less"
                else
                    if languagesSum.children[targetCountSum].text.strip == "More"
                    else
                        @targetLanguages = @targetLanguages + ", " + languagesSum.children[targetCountSum].text.split("to").first.strip
                    end
                   
                end
            end
        end

        targetCountSum = targetCountSum + 1
    end
    end
 
    tables = parsed_page.css('table')
    rows = tables[4].css('tr')
    columns = rows.css('td')
    allDivs = columns.css('div')
    if allDivs.empty?
        rows = tables[5].css('tr')
        columns = rows.css('td')
        allDivs = columns.css('div')
        if allDivs.empty?
            @country = ""
        else
            @country = allDivs[0].text.split("Local").first.split(",").last.strip
        end
    else
        @country = allDivs[0].text.split("Local").first.split(",").last.strip
    end
  
    end
    
       
end

