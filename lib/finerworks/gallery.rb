module FinerWorks
  class Gallery < Hashie::Dash
    include Hashie::Extensions::Dash::PropertyTranslation

    property :title, from: "GalleryTitle"
    property :active, from: "GalleryActive", transform_with: -> (value) { value == "True" }
    property :guid, from: "GalleryGUID"

    alias_method :active?, :active
  end
end
