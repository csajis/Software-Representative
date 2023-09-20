# frozen_string_literal: true

require 'doc_validator'

# Modelo para usuario Votante
class Voter < User
  include PgSearch

  has_many :comments, dependent: :nullify
  has_many :votations, foreign_key: :owner_id

  has_many :votes
  has_many :subscriptions

  belongs_to :identity_doc, required: false

  has_many :voted_votations, through: :votes, source: :votation
  has_many :subscribed_votations, through: :subscriptions, source: :votation

  def self.search(search)
    if !search.blank?
      search_for(search).where(:type => "Voter")
    else
      all
    end
  end  

  pg_search_scope(
    :search_for,
    against: %i[email FirstName],
    ignoring: :accents,
    ranked_by: ':trigram',
    using: {
      tsearch: { any_word: true },
      trigram: {
        threshold: 0.10
      }
    }
  )

  def validated_doc?
    !identity_doc.nil?
  end

  def validate_doc!(doc_type, run, doc_number)
    status = DocValidator.validate(doc_type, run, doc_number)
    if status == 'Vigente'
      create_identity_doc!(doc_type: doc_type.downcase, run: run, doc_number: doc_number)
      :validated
    else
      :failed
    end
  end

  def validate_doc(doc_type, run, doc_number)
    if validated_doc?
      :already_validated
    elsif !IdentityDoc.find_by(run: run).nil?
      :exists
    else
      validate_doc!(doc_type, run, doc_number)
    end
  end
end
