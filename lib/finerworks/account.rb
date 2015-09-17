module FinerWorks
  class Account < Hashie::Trash
    property :business_company_name, from: "AccountBusinessCompanyName"
    property :business_department, from: "AccountBusinessDepartment"
    property :company_description, from: "AccountCompanyDescription"
    property :business_website_url, from: "AccountBusinessWebsiteURL"
    property :business_address1, from: "AccountBusinessAddress1"
    property :business_address2, from: "AccountBusinessAddress2"
    property :business_city, from: "AccountBusinessCity"
    property :business_state, from: "AccountBusinessState"
    property :business_country, from: "AccountBusinessCountry"
    property :business_zip, from: "AccountBusinessZip"
    property :business_phone, from: "AccountBusinessPhone"
    property :business_fax, from: "AccountBusinessFax"
    property :username, from: "AccountUsername"
    property :registration_date, from: "AccountRegistrationDate", transform_with: lambda { |d| FinerWorks::Utilities.parse_api_time(d) }
    property :email, from: "AccountEmail"
    property :type, from: "AccountType"
    property :first_name, from: "AccountFirstName"
    property :middle_name, from: "AccountMiddleName"
    property :last_name, from: "AccountLastName"
    property :phone, from: "AccountPhone"
    property :logo_file, from: "AccountLogoFile"
    property :portrait_file, from: "AccountPortraitFile"
    property :bio, from: "AccountBio"
    property :title, from: "AccountTitle"
    property :seller_paypal_email, from: "AccountSellerPayPalEmail"
  end
end
