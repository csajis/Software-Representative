# frozen_string_literal: true

# Clase que describe la Votacion
class Votation < ApplicationRecord
  include PgSearch
  include AASM

  has_many :votes
  has_many :voters, through: :votes
  belongs_to :owner, class_name: 'Voter'
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :voter
  has_many :comments
  has_many :options, class_name: 'VotationOption'
  has_one :votation_result, required: false
  has_many :votation_rt_results
  has_many :moderations
  has_many :moderators, through: :moderations, source: :admin

  pg_search_scope(
    :search_for,
    against: [:name, :description],
    ignoring: :accents,
    ranked_by: ':trigram',
    using: {
      tsearch: { any_word: true },
      trigram: {
        threshold: 0.10
      }
    }
  )

  aasm column: 'state' do
    state :unsaved, initial: true
    state :created
    state :published
    state :started
    state :moderated
    state :deleted
    state :ended

    event :create do
      transitions from: [:unsaved, :published], to: :created
    end

    event :publish do
      transitions from: [:created], to: :published
    end

    event :start do
      transitions from: [:published,:ended], to: :started
    end

    event :delete do
      transitions from: [:created, :started, :published, :ended], to: :deleted
    end

    event :end do
      transitions from: [:started], to: :ended, after: :process_final_result
    end

    event :moderate do
      transitions from: [:created, :started, :published, :ended], to: :moderated
    end
  end

  scope :own_votations, -> (user) {
    where(owner_id: user)
  }

  default_scope { where(displayed: true) }

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :options
  validates :name, presence: true

  def data_for_piechart
    aux = {}
    options.each do |option|
      aux[option.name] = option.votes.count
    end
    aux
  end

  def send_notification_result
    subscribers.each do |subscriber|
      NotificationMailer.notification_email(subscriber, self).deliver_later
    end
    NotificationMailer.notification_email(owner, self).deliver_later
  end

  def process_final_result
    create_votation_result!(final_result: data_for_piechart)
    send_notification_result
  end

  def archive
    update_attributes!(displayed: false)
  end

  def self.search(search)
    if !search.blank?
      search_for(search)
    else
      all
    end
  end
end
