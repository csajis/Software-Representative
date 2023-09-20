class IdentityDoc < ApplicationRecord
  has_one :voter, dependent: :nullify
  # CEDULA,CEDULA_EXT,PASAPORTE_PG,PASAPORTE_DIPLOMATICO,PASAPORTE_OFICIAL
  enum doc_type: [
    :cedula,
    :cedula_ext,
    :pasaporte_pg,
    :pasaporte_diplomatico,
    :pasaporte_oficial
  ]

  def self.doc_type_by_id(doc_type_id)
    doc_types.key(doc_type_id)
  end
end
