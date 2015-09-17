module FinerWorks
  class Image < Hashie::Trash
    property :guid, from: "ImageGUID"
    property :url, from: "ImageUrl"
    property :url_thumbnail, from: "ImageUrl_Thumbnail"
    property :original_file_name, from: "ImageOriginalFileName"
    property :file_name, from: "ImageFileName"
    property :date_added, from: "ImageDateAdded", transform_with: -> (d) { FinerWorks::Utilities.parse_api_time(d) }
    property :active, from: "ImageActive", transform_with: -> (value) { value == "True" }
    property :file_size, from: "ImageFileSize"
    property :w, from: "ImageW"
    property :h, from: "ImageH"
    property :title, from: "ImageTitle"
    property :date_updated, from: "ImageDateUpdated", transform_with: -> (d) { FinerWorks::Utilities.parse_api_time(d) }
    property :rank, from: "ImageRank"
    property :order, from: "ImageOrder"
    property :rating, from: "ImageRating"
    property :description, from: "ImageDescription"
    property :gallery_guid, from: "GalleryGUID"
    property :gallery_title, from: "GalleryTitle"
    property :gallery_active, from: "GalleryActive"

    alias_method :active?, :active
    alias_method :gallery_active?, :active
  end
end
