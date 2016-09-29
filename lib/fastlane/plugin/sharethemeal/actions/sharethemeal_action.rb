require 'rest-client'
require 'base64'
require 'json'
require 'uri'
module Fastlane
    module Actions
        class SharethemealAction < Action
            def self.run(params)
              begin
                  bearer = 'LAXQszxcmpGMWi24y0NFt00YPWGJnJOo9Ba8ijLcI1fmiKHI1PDF7KG7PGJU7KcX'
                  token_payload = {
                      'userHash' => params[:userhash],
                      'currency' => params[:currency]
                  }

                  client_token = RestClient.post('https://api.sharethemeal.org/api/payment/braintree/client-tokens', token_payload.to_json,
                                                 content_type: :json, accept: :json,
                                                 Authorization: "Bearer #{bearer}")

                  client_token_response = JSON.parse(client_token)

                  auth_reply = JSON.parse(Base64.decode64(client_token_response['clientToken']))
                  finger_print =  URI.encode_www_form_component(auth_reply['authorizationFingerprint'])

                  payment_infos = RestClient.get("https://api.braintreegateway.com/merchants/#{auth_reply['merchantId']}/client_api/v1/payment_methods?sharedCustomerIdentifierType=undefined&braintreeLibraryVersion=braintree%2Fweb%2F2.15.5&merchantAccountId=#{auth_reply['merchantAccountId']}&authorizationFingerprint=#{finger_print}&callback=")
                  payment_infos_json = JSON.parse(payment_infos)

                  transaction_payload = {
                      'userHash' => params[:userhash],
                      'amount' => params[:amount],
                      'currency' => params[:currency],
                      'paymentMethodNonce' => payment_infos_json['paymentMethods'].first['nonce'],
                      'teamId' => params[:team_id]
                  }
                  
                  transaction_response = RestClient.post('https://api.sharethemeal.org/api/payment/braintree/transactions', transaction_payload.to_json, content_type: :json, accept: :json,
                                                                                                                                                         'Authorization' => "Bearer #{bearer}")

                  transaction_response_json = JSON.parse(transaction_response)
                  if transaction_response_json['result']['donationCreated'] == true
                      UI.success "Successfully Donated #{params[:amount]} #{params[:currency]} to ShareTheMeal 🍔 "
                  else
                      UI.warning 'Donation was not successfully accepted, maybe card is invalid or something else'
                  end

              rescue => err
                  UI.error "Donation failed, be sure that you have done atleast one manual donation with a stored payment option: #{err}"
              end
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
