@EndUserText.label: 'CSV Uploaded Data'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZVKS_C_CSVUploadedData
  as projection on ZVKS_R_CSVUploadedDataTP
{
      @UI.hidden: true
  key UUID,

      @UI.hidden: true
      UploadMasterUUID,

      @UI.lineItem: [{ position: 10 }]
      @UI.multiLineText: true
      Data,

      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,

      /* Compositions */
      _UploadMaster : redirected to parent ZVKS_C_CSVUploadMaster
}
