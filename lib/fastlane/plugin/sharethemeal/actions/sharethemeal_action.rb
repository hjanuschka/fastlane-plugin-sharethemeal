require 'rest-client'
require 'base64'
require 'json'
require 'uri'
require 'stm_api'
module Fastlane
  module Actions
    class SharethemealAction < Action
      def self.run(params)
        FastlaneCore::PrintTable.print_values(config: params, hide_keys: [:userhash], title: "Summary for ShareTheMeal")
        api = StmApi::Donation.new(params)
        result = api.donate(amount: params[:amount])
        if result == true
          UI.success "Successfully Donated #{params[:amount]} #{params[:currency]} to ShareTheMeal 🍔 "
        else
          UI.important 'Donation was not successfully accepted, maybe card is invalid or something else'
        end
      rescue => err
        puts err.backtrace
        UI.error "Donation failed, be sure that you have done atleast one manual donation with a stored payment option: #{err.backtrace}"
      end

      def self.description
        'Donate ShareTheMeal'
      end

      def self.authors
        ['hjanuschka']
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :userhash,
                                         env_name: 'SHARETHEMEAL_USERHASH',
                                         description: 'ShareTheMeal USERHASH',
                                         optional: false,
                                         type: String),
          FastlaneCore::ConfigItem.new(key: :amount,
                                         env_name: 'SHARETHEMEAL_AMOUNT',
                                         description: 'ShareTheMeal Amount',
                                         optional: false,
                                         type: String),
          FastlaneCore::ConfigItem.new(key: :currency,
                                         env_name: 'SHARETHEMEAL_CURRENCY',
                                         description: 'ShareTheMeal Currency',
                                         default_value: 'EUR',
                                         optional: false,
                                         type: String),
          FastlaneCore::ConfigItem.new(key: :team_id,
                                         env_name: 'SHARETHEMEAL_TEAM_ID',
                                         description: 'ShareTheMeal Team ID',
                                         default_value: 'fastlane',
                                         optional: false,
                                         type: String)

        ]
      end

      def self.is_supported?(_platform)
        true
      end
    end
  end
end
