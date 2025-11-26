@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@EndUserText: {
  label: '##GENERATED travel app'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZRAP100_ATRAV666'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZRAP100_C_TRAVELTP_666
  provider contract transactional_query
  as projection on ZRAP100_R_TRAVELTP_666
  association [1..1] to ZRAP100_R_TRAVELTP_666 as _BaseEntity on $projection.TravelID = _BaseEntity.TravelID
{

// Enable full text search on selected fields
  @Search.defaultSearchElement: true
// Enable fuzzy search on selected fields
  @Search.fuzzinessThreshold: 0.9
  key TravelID,
  
// Enable the full-text search, define a value help, and specified AgencyName as associated text
  @Search.defaultSearchElement: true
  @ObjectModel.text.element: ['AgencyName']
// The content of the AgencyID field will be listed which belongs to /DMO/I_Agency CDS
  @Consumption.valueHelpDefinition: [ {
    entity.element: 'AgencyID', 
    entity.name: '/DMO/I_Agency', 
    useForValidation: true
  } ]
  AgencyID,
  _Agency.Name        as AgencyName,
  @Search.defaultSearchElement: true
  @ObjectModel.text.element: ['CustomerName']
  @Consumption.valueHelpDefinition: [ {
    entity.element: 'CustomerID', 
    entity.name: '/DMO/I_Customer', 
    useForValidation: true
  } ]
  CustomerID,
  _Customer.LastName  as CustomerName,
  BeginDate,
  EndDate,
  @Semantics: {
    amount.currencyCode: 'CurrencyCode'
  }
  BookingFee,
  @Semantics: {
    amount.currencyCode: 'CurrencyCode'
  }
  TotalPrice,
  @Consumption.valueHelpDefinition: [ {
    entity.element: 'Currency', 
    entity.name: 'I_Currency', 
    useForValidation: true
  } ]
  CurrencyCode,
  Description,
  @ObjectModel.text.element: ['OverallStatusText']
  @Consumption.valueHelpDefinition: [ {
    entity.element: 'OverallStatus', 
    entity.name: '/DMO/I_Overall_Status_VH', 
    useForValidation: true
  } ]
  OverallStatus,
// localized means, that the text is provided in the user's language
  _OverallStatus._Text.Text as OverallStatusText : localized,
  Attachment,
  MimeType,
  FileName,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  _BaseEntity

}
