class ReportCard
  attr_reader :report_card_id, :math, :science, :english, :german, :art

  def initialize(report_card_id:, math:, science:, english:, german:, art:)
    @report_card_id = report_card_id
    @math = math
    @science = science
    @english = english
    @german = german
    @art = art
  end

  def to_h
    {
      report_card_id: report_card_id,
      math: math,
      science: science,
      english: english,
      german: german,
      art: art,
    }
  end
end
