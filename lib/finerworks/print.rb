require 'time'

module FinerWorks
  class Print < Hashie::Trash
    property :add_on_title, from: "AddOnTitle"
    property :canvas_add_on_name, from: "CanvasAddOnName"
    property :card_stock_name, from: "CardStockName"
    property :card_style_name, from: "CardStyleName"
    property :image_guid, from: "ImageGUID"
    property :image_title, from: "ImageTitle"
    property :media_name, from: "MediaName"
    property :mounting_name, from: "MountingName"
    property :date_added, from: "PrintDateAdded", transform_with: lambda { |d| Time.parse(d) }
    property :description, from: "PrintDescription"
    property :guid, from: "PrintGUID"
    property :media_id, from: "PrintMediaID"
    property :minor_retouch, from: "PrintMinorRetouch"
    property :mounting_id, from: "PrintMountingID"
    property :preview_file, from: "PrintPreviewFile"
    property :product_preview_file, from: "PrintProductPreviewFile"
    property :sale_price, from: "PrintSalePrice"
    property :shipping_additional_price, from: "PrintShippingAdditionalPrice"
    property :shipping_base_price, from: "PrintShippingBasePrice"
    property :title, from: "PrintTitle"
    property :gallery_guid, from: "GalleryGUID"
    property :thumbnail_url, from: "PrintThumbnailUrl"
  end
end
