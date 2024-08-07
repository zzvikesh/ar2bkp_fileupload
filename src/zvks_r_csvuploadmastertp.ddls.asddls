@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CSV Upload Master TP'
define root view entity ZVKS_R_CSVUploadMasterTP
  as select from ZVKS_R_UploadMaster
  composition [0..*] of ZVKS_R_CSVUploadedDataTP as _UploadedData
{
  key UUID,
      ID,
      Text,
      ProcessorClass,

      /*
      The file attachment is either displayed in the browser (setting #INLINE), or;
      downloaded when selected (option #ATTACHMENT)
      */
      @Semantics.largeObject:
        {
            mimeType: 'MimeType',
            fileName: 'FileName',
            acceptableMimeTypes: [ 'text/csv' ],
            contentDispositionPreference: #INLINE
        }
      Attachment,

      @Semantics.mimeType: true
      MimeType,

      FileName,

      @Semantics.largeObject:
        {
            mimeType: 'TemplateMimeType',
            fileName: 'TemplateFileName',
            acceptableMimeTypes: [ 'text/csv' ],
            contentDispositionPreference: #INLINE
        }      
      TemplateAttachment,

      @Semantics.mimeType: true
      TemplateMimeType,

      TemplateFileName,

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
      
      /* Compositions */
      _UploadedData
}
