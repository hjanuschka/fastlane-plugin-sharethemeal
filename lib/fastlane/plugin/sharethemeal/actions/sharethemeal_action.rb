module Fastlane
  module Actions
    class SharethemealAction < Action
      def self.run(params)
        if Helper.ci?
          UI.important("Running on CI, skipping donation")
          return
        end

        stmurl = "https://sharethemeal.org/de/checkout.html?"
        stmurl << "userhash=#{params[:userhash]}&"
        stmurl << "lang=#{params[:language]}&"
        stmurl << "currency=EUR&"
        stmurl << "symbol=€&"
        stmurl << "amount=0.4&"
        stmurl << "version=2&"
        stmurl << "beneficiaryUri=#{params[:beneficiary_uri]}&"
        stmurl << "beneficiarySource=contentful&"
        stmurl << "thankYouUri=#{params[:thank_you_uri]}"
        
        `open "#{stmurl}"`
      end

      def self.description
        "Donate ShareTheMeal"
      end

      def self.authors
        ["hjanuschka"]
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
          FastlaneCore::ConfigItem.new(key: :beneficiary_uri,
                env_name: "SHARETHEMEAL_BENEFICIARYURI",
             description: "ShareTheMeal Beneficiary Uri",
                optional: false,
          type: String),
          FastlaneCore::ConfigItem.new(key: :beneficiary_source,
                env_name: "SHARETHEMEAL_BENEFICIARYSOURCE",
             description: "ShareTheMeal Beneficiary Source",
                optional: false,
          type: String),
          FastlaneCore::ConfigItem.new(key: :thank_you_uri,
                env_name: "SHARETHEMEAL_THANKYOUURI",
             description: "ShareTheMeal Thank you URI",
                optional: false,
          type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
