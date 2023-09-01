class ReadmeeHelperController < ApplicationController
    def index
    end
    
    # def call_chatgpt
    #    @response = ChatgptService.call(params[:message])
    # end
    def reply
        user_message = params[:message]
        @reply = ChatgptService.call(user_message)
      
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream.replace("reply", partial: "/views/readmee_helper/gpt")
          end
        end
      end
      
end
