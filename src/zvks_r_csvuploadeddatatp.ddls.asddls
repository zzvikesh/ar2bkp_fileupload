@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CSV Uploaded Data TP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZVKS_R_CSVUploadedDataTP
  as select from ZVKS_R_UploadedData
  association to parent ZVKS_R_CSVUploadMasterTP as _UploadMaster on $projection.UploadMasterUUID = _UploadMaster.UUID
{
  key UUID,
      UploadMasterUUID,
      Data,

      /*Administrative Fields*/
      @EndUserText.label : 'Created By'
      @Semantics.user.createdBy: true
      CreatedBy,

      @EndUserText.label : 'Created At'
      @Semantics.systemDateTime.createdAt: true
      CreatedAt,

      @EndUserText.label : 'Local Last Changed By'
      @Semantics.user.localInstanceLastChangedBy: true
      LocalLastChangedBy,

      //Local ETag
      @EndUserText.label : 'Local Last Changed At'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      //Total ETag
      @EndUserText.label : 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,

      _UploadMaster
}
