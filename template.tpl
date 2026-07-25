___TERMS_OF_SERVICE___
By creating or modifying this file you agree to Google Tag Manager's Community Template Gallery Developer Terms of Service available at https://developers.google.com/tag-manager/gallery-tos (or such other URL as Google may provide), as modified from time to time.

___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "BoostYourLeads Pixel",
  "categories": [
    "ANALYTICS",
    "ATTRIBUTION",
    "LEAD_GENERATION"
  ],
  "brand": {
    "id": "brand_boostyourleads",
    "displayName": "BoostYourLeads"
  },
  "description": "The official BoostYourLeads Pixel for web attribution, B2B firmographics resolution, and automated lead scoring.",
  "containerContexts": [
    "WEB"
  ]
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "clientId",
    "displayName": "BoostYourLeads Client ID (User UID)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "helpHint": "Your unique BYL account identifier, found in the Co-Pilot settings portal."
  },
  {
    "type": "CHECKBOX",
    "name": "trackPageview",
    "displayName": "Automatically Track Pageviews",
    "checkboxText": "Capture page visits, referrers, and UTM parameters",
    "simpleValueType": true
  },
