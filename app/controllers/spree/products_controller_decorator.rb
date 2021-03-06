Spree::ProductsController.class_eval do
  include FiltersInitialization

  def index
    @searcher   = build_searcher(params.to_unsafe_h.merge(include_images: true))
    @products   = @searcher.custom_retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    filters_init
  end
end
