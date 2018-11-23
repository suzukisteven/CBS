class TextController < ApplicationController
    def show
        @text = Text.new
        @texts = Text.all
        tone_analyzer = ToneAnalyzerV3.new(
          version: "2017-09-21",
          iam_apikey: "UWJozDl7pHknFO2gwy96WEnVmdO0TRCXyM68t0w5N6Vj",
          url: "https://gateway.watsonplatform.net/tone-analyzer/api"
        ) 
        if(Text.last)
            text=Text.last.data
            tone = tone_analyzer.tone(
            tone_input: {text: text},
            content_type: "application/json"
            )
            @sentence_tone_score= tone.result
            @document_tone = []
            tone.result.each do |key, value| 
                if key == "sentences_tone"
                    @document_tone = value
                end 
            end 
         end
    end

    def create
        @text = Text.new(text_params)
        @text.save  
        redirect_to text_analyze_path  
    end
    

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_text
          @text = Text.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def text_params
          params.require(:text).permit(:data)
        end

end
