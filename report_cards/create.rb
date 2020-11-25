require 'json'
require 'securerandom'
require_relative 'report_card_repo'

def lambda_handler(event:, context:)
  body = JSON.parse(event["body"])
  report_cards = ReportCardRepo.new

  params = body.merge({"report_card_id" => SecureRandom.uuid})

  report_card = report_cards.create(params)

  {
    statusCode: 201,
    body: report_card.to_h.to_json
  }
end
