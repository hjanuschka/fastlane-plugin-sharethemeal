module Fastlane
  module Actions
    class SharethemealAction < Action
      def self.run(params)
        stmurl = "https://sharethemeal.org/de/checkout.html?"
        stmurl << "userhash=#{params[:userhash]}&"
        stmurl << "lang=#{params[:language]}&"
        stmurl << "currency=EUR&"
        stmurl << "symbol=€&"
        stmurl << "amount=0.4&"
        stmurl << "version=2&"
        stmurl << "beneficiaryUri=#{params[:beneficiaryUri]}&"
        stmurl << "beneficiarySource=contentful&"
        stmurl << "thankYouUri=#{params[:thankYouUri]}"
        
        `open "#{stmurl}"`

      end

      def self.description
        "ShareTheMeal"
      end

      def self.authors
        ["Helmut Januschka"]
      end

      
      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :userhash,
                                           env_name: "SHARETHEMEAL_USERHASH",
                                        description: "ShareTheMeal UserHash",
                                           optional: false,
                                               type: String),
          FastlaneCore::ConfigItem.new(key: :amount,
                env_name: "SHARETHEMEAL_AMOUNT",
             description: "ShareTheMeal Amount",
                optional: false,
                    type: String),
          FastlaneCore::ConfigItem.new(key: :language,
                env_name: "SHARETHEMEAL_LANGUAGE",
             description: "ShareTheMeal Language",
                optional: false,
          type: String),
          FastlaneCore::ConfigItem.new(key: :beneficiaryUri,
                env_name: "SHARETHEMEAL_BENEFICIARYURI",
             description: "ShareTheMeal Beneficiary Uri",
                optional: false,
          type: String),
          FastlaneCore::ConfigItem.new(key: :beneficiarySource,
                env_name: "SHARETHEMEAL_BENEFICIARYSOURCE",
             description: "ShareTheMeal Beneficiary Source",
                optional: false,
          type: String),
          FastlaneCore::ConfigItem.new(key: :thankYouUri,
                env_name: "SHARETHEMEAL_THANKYOUURI",
             description: "ShareTheMeal Thank you URI",
                optional: false,
          type: String)
        ]
      end

      def self.is_supported?(platform)
        [:mac].include?(platform)
      end
    end
  end
end
