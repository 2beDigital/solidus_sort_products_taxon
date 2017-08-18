Spree::Admin::ProductsController.class_eval do
	def update
        if params[:product][:taxon_ids].present?
          params[:product][:taxon_ids] = params[:product][:taxon_ids].split(',').map(&:to_i)
          taxons = @product.taxons ? params[:product][:taxon_ids] - @product.taxons.ids : params[:product][:taxon_ids]
        end
        if params[:product][:option_type_ids].present?
          params[:product][:option_type_ids] = params[:product][:option_type_ids].split(',')
        end        
        invoke_callbacks(:update, :before)
        if @object.update_attributes(permitted_resource_params)
          invoke_callbacks(:update, :after)
          @product.put_in_taxons_top(taxons) if taxons && SolidusSortProductsTaxon::Config.activated # added to insert new products in top of taxon
          flash[:success] = flash_message_for(@object, :successfully_updated)
          respond_with(@object) do |format|
            format.html { redirect_to location_after_save }
            format.js   { render layout: false }
          end
        else
          # Stops people submitting blank slugs, causing errors when they try to
          # update the product again
          @product.slug = @product.slug_was if @product.slug.blank?
          invoke_callbacks(:update, :fails)
          respond_with(@object)
        end
    end    
end