ThinkingSphinx::Index.define :product, with: :active_record do
  indexes title, sortable: true
  indexes article
  indexes description
  indexes price, sortable: true

  has count, category_id, created_at, updated_at
end
