Spree::Product.class_eval do
	def put_in_taxons_top(taxons)
		taxons.each do |taxon|
			clasification(self.id, taxon)
		end
	end

	def clasification(product_id, taxon_id)
	    classification = Spree::Classification.find_by(
	      :product_id => product_id,
	      :taxon_id => taxon_id
	    )
	    classification.insert_at(1)
	end
end