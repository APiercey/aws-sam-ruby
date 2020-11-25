require 'aws-sdk-dynamodb'
require_relative 'report_card'

class ReportCardRepo
  def initialize
    Aws.config.update({endpoint: "http://dynamodb:8000"})

    @client = Aws::DynamoDB::Client.new
  end

  def create(attrs)
    report_card = to_report_card(attrs)

    client.put_item({
      table_name: "report_cards",
      item: report_card.to_h
    })

    report_card
  end

  def all
    client
      .scan({table_name: "report_cards"})
      .items
      .map { |item| to_report_card(item) }
  end

  def fetch(id)
    resp = client.get_item({table_name: "report_cards",
                            key: { report_card_id: id }})

    to_report_card(resp.item)
  end

  private

  def to_report_card(attrs)
    report_card = ReportCard.new({
      report_card_id: attrs.fetch("report_card_id"),
      math: attrs.fetch("math", nil),
      science: attrs.fetch("science", nil),
      english: attrs.fetch("english", nil),
      german: attrs.fetch("german", nil),
      art: attrs.fetch("art", nil),
    })
  end

  attr_reader :client
end
