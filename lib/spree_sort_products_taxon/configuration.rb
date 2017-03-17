module SpreeSortProductsTaxon
	class Configuration < Preferences::Configuration
		preferences :activated, :boolean, default: false
	end
end
