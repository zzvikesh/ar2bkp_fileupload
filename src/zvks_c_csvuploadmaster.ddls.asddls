@EndUserText.label: 'CSV Upload Master'
@AccessControl.authorizationCheck: #NOT_REQUIRED
//@Metadata.ignorePropagatedAnnotations: true

-- Header Info (List and Object Page)
@UI.headerInfo: { typeName: 'ID',
                  typeNamePlural: 'Text',
                  title:{ value: 'ID', type: #STANDARD, label: 'Testing' },
                  description: { value: 'Text', type: #STANDARD, label: 'Testing' }
                 }
@ObjectModel:{ semanticKey: ['ID','Text'] }
//@Search.searchable: true
define root view entity ZVKS_C_CSVUploadMaster
  provider contract transactional_query
  as projection on ZVKS_R_CSVUploadMasterTP
{
      -- Facets / Object Page Tabs
      @UI.facet: [
      -- Subgroup Facet: Header Tab with Sub Groups
      {
        id              : 'idFile',
        label           : 'File',
        type            : #COLLECTION,
        position        : 10
      },
      {
        parentId        : 'idFile',
        id              : 'idUploadFile',
        label           : 'Upload File',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqUploadFile',
        position        : 10
      },
      {
        parentId        : 'idFile',
        id              : 'idDownloadTemplate',
        label           : 'Download Template',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqDownloadTemplate',
        position        : 20
      },
      -- Facet: Line Item Facet
      {
        id              : 'idUploadedData',
        purpose         : #STANDARD,
        type            : #LINEITEM_REFERENCE,
        label           : 'Staged Data',
        position        : 20,
        targetElement   : '_UploadedData'
      },
      -- Header Facet: Header Tab      
      {
        id              : 'idAdministrativeFields',
        label           : 'Administrative Fields',
        type            : #FIELDGROUP_REFERENCE,
        targetQualifier : 'tqAdministrativeFields',
        position        : 30
      }]

      @UI.hidden: true
  key UUID,

      @UI:{ lineItem: [{ position: 10, importance: #LOW }],
            selectionField: [{ position: 10 }] }
      ID,

      @UI:{ lineItem: [{ position: 20, importance: #LOW }],
            selectionField: [{ position: 20 }] }
      Text,

      @UI.hidden: true
      ProcessorClass,

      @UI:{ fieldGroup: [{ qualifier: 'tqUploadFile', position: 10 }] }
      Attachment,
      @UI.hidden: true
      MimeType,
      @UI.hidden: true
      FileName,

      @UI:{ fieldGroup: [{ qualifier: 'tqDownloadTemplate', position: 20 }] }
      TemplateAttachment,
      @UI.hidden: true
      TemplateMimeType,
      @UI.hidden: true
      TemplateFileName,

      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 10 }] }
      CreatedBy,
      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 10 }] }
      CreatedAt,
      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 10 }] }
      LocalLastChangedBy,
      @UI:{ fieldGroup: [{ qualifier: 'tqAdministrativeFields', position: 10 }] }
      LocalLastChangedAt, //Local ETag
      @UI.hidden: true
      LastChangedAt,      //Total ETag

      /* Compositions */
      _UploadedData : redirected to composition child ZVKS_C_CSVUploadedData
}
