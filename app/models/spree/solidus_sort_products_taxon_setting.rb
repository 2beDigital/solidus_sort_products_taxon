module Spree
	class SolidusSortProductsTaxonSetting < Preferences::Configuration
		preference :activated, :boolean, default: false
	end
end