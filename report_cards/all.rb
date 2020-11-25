require_relative 'report_card_repo'

def lambda_handler(event:, context:)
  report_cards = ReportCardRepo.new

  puts report_cards.all.inspect

  {
    statusCode: 200,
    body: report_cards.all
                      .map(&:to_h)
                      .to_json
  }
end
