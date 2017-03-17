module Spree
	class SpreeSortProductsTaxonSetting < Preferences::Configuration
		preference :activated, :boolean, default: false
	end
end