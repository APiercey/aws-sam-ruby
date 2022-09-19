require_relative 'report_card_repo'

def lambda_handler(event:, context:)
  report_cards = ReportCardRepo.new

  params = event["pathParameters"]

  report_card = report_cards.fetch(params["report_card_id"])

  if report_card
    {
      statusCode: 200,
      body: report_card.to_h.to_json
    }
  else
    {
      statusCode: 404,
      body: {
        error: "No report card found."
      }
    }
  end

end
