class Company < ActiveRecord::Base
  include PgSearch

  PgSearch::ScopeOptions.class_eval do
    def to_relation
      @model.select("#{quoted_table_name}.*, (#{rank}) AS tsrank").where(conditions)
    end
  end

  PLANS = %w(none plus)

  has_and_belongs_to_many :searches

  attr_accessible :name, :phone, :segments, :products, :plan, as: :import

  validates :name, :phone, :segments, presence: true
  validates :username, format: {with: /\A[-_\.a-z0-9]+\Z/}, allow_blank: true
  validates :plan, inclusion: {in: PLANS}

  scope :all_to_sitemap, where("plan != 'none' and username != ''")

  pg_search_scope :search,
    ignoring: :accents,
    against:  {name: 'A', segments: 'C', products: 'B'},
    using:    {tsearch: {dictionary: 'portuguese', prefix: true, any_word: true}}

  def have_page?
    plan != 'none' && username != ''
  end
end