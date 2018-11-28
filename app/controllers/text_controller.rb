class TextController < ApplicationController

    def show
        @text = Database.new
        @texts = Database.all
        @company = Company.find(params[:company_id])
        @employees = @company.users
        if(Database.last)
          if(Database.last.text_result)

              Database.last.text_result.each do |key, value|
                  if key == "sentences_tone"
                      @document_tone = value
                  end
              end
          else
              text = Database.last.text
              tone = tone_analyzer.tone(
              tone_input: {text: text},
              content_type: "application/json"
              )
              @sentence_tone_score= Database.last.text_result
              @document_tone = []
              Database.last.update(text_result:tone.result)
           end
        end
    end

    def create
        @text = Database.new(text_params)
        @text.user_id = current_user.id
        @text.save
        tone_analyzer = ToneAnalyzerV3.new(
          version: "2017-09-21",
          iam_apikey: ENV['TEXT_KEY'],
          url: "https://gateway.watsonplatform.net/tone-analyzer/api"
        )
        if(Database.last)
          if(Database.last.text_result)

              Database.last.text_result.each do |key, value|
                  if key == "sentences_tone"
                      @document_tone = value
                  end
              end
          else
              text = Database.last.text
              tone = tone_analyzer.tone(
              tone_input: {text: text},
              content_type: "application/json"
              )
              @sentence_tone_score= Database.last.text_result
              @document_tone = []
              Database.last.update(text_result:tone.result)
           end
        end

        @database = Database.last.to_json
        p @database

        respond_to do |format|
          format.html { redirect_to text_analyze_path }
          format.js
        end
    end


      private
        # Use callbacks to share common setup or constraints between actions.
        def set_text
          @text = Database.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def text_params
          params.require(:database).permit(:text)
        end

end
