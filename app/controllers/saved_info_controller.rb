class SavedInfoController < ApplicationController
    def index
        linguists = Linguists.new
        linguists.firstname = params[:@firstname]
        linguists.lastName = params[:@lastname]    
        linguists.country = params[:@country] 
        linguists.nativelanguage = params[:@nativeLanguage] 
        linguists.targetLanguages = params[:@targetLanguages] 
        linguists.url = params[:@url] 
        linguists.save
    end
end
