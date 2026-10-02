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
  ],
  "icon": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAEMUlEQVR42u2YTyh0XRzHv+fec2eSPyVWskA2llMWYsGOsrOxIiVCU2QjpSxEKdmJhZKiRikpJJEiG2XJWJBJRqGY8Sdm7p/vu3jeuZln6OnN8HpyfnW73XN+3XPP5/7+HgGA+MGi4YeLAqAAKAAKgAKgACgACoACoAAoAAqAAqAAKAAKgAKgACgAP0tk2khqGoQQSWNCCNi2DZJJ8yThOE6SnqZp7lxCHwAcxwH5eQfX4iuOxYUQKZt4a+yvtABN0+A4DpqamlBTU4N4PA4AiMfjCAaDWFhYwN3dHfr7+1FSUgIhBGZnZ7G7uwspJSzLQlFREfr7+yGEwM3NDfb29tDQ0ACSGB0dxcnJibvOZwg/cum6TgCcnZ3lW3J8fMy8vDzW19e7Y6enp8zJyaFhGATA1dVVd87v97O9vd19rq6uTlrnE670AJiYmKBpmoxEIuzr6+PKygpN0yRJ9vb2EgDHx8fdjU1MTBAAW1tbSZK2bXNra4sA2NXVRdM0aZomKysr/w4Ak5OTJMnb21sCoNfrZSQSoW3bHBkZoaZpzM7O5uHhIR3HoWVZbGlpYSgUom3bjEajLCsroxCC3d3dLqiqqqpPBSDT7U+6rqOiogJVVVXIysqCpmnY39+H4zh4eHhAZ2cntre3IYTAzMwMHMeBpmkYGBhAMBgEANi2/aWBMC0WMDU1RZKMx+OMx+OuWc/NzREAhRCUUhIAx8bGSJKxWIwkubm5SSGEGxP8fv+XWYD2GSnPMAw3Q9TW1mJychKGYYAkdF3H4OAggsEgDMNANBqF3+8HyZQ64k/r/Bf9T68EEzn96ekJ9fX1qKmpwfr6OvLz89HR0YGGhgbYtg1d1/H09ISjoyMIIXB5eYmzszO36HnLpaSU0HUduq4n1RCvC6b/vRJMiGVZ2NnZwePjI2KxGOrq6mBZFsrLyxEIBNwNeDyeXx8gJQzDQCwWe/N90WgUlmWlwM7NzYWUEjc3N98DQKK81TQNPp8P9/f36O7uhmVZkFLi6uoqRff1/XdJWENjYyN8Ph+klBBCIBAIoLi4GMvLy8jIyEBzczM2NjY+VCilJQhOT0+7gctxnKRi6Pz8nIWFhUmBcG1tjSR5dnbGzMzMXynp37menh6+J6WlpRwaGnKfFxcXPxQk02YB19fXCIfDeH5+dgPe4+MjDg4OMDw8jIuLCwgh3L8UDodxeXmJUCiUYgGRSMR91+sGKuHvS0tLaGtrQ0ZGBubn579HM+TxeGAYhmvSQgiYpun67+/Nj9frhZQStm3j5eUl2S+lhNfrTTFpIQRisRhs20ZBQQE8Hg9CodD37gZ1XU9pf9PZXX60q0wrgLfy8nsf91r3LZ33cvzrjb92qW99HqCOxBQABUABUAAUAAVAAVAAFAAFQAFQABQABUABUAAUAAVAAVAAFAAFQAH4DvIPgD6BRG2dQMAAAAAASUVORK5CYII="
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
  {
    "type": "CHECKBOX",
    "name": "trackForms",
    "displayName": "Automatically Capture Form Fills",
    "checkboxText": "Securely match and attribute form submissions for lead scoring",
    "simpleValueType": true
  }
]

___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const copyFromWindow = require('copyFromWindow');
const callInWindow = require('callInWindow');

const trackingUrl = 'https://back-end.boostyourleads.ca/byl-tag.js';

// Inject the core tracking script on the user's webpage
injectScript(trackingUrl, () => {
  const byl = copyFromWindow('byl');
  if (byl) {
    callInWindow('byl', 'init', data.clientId);
    
    if (data.trackPageview) {
      callInWindow('byl', 'track', 'pageview');
    }
    
    if (data.trackForms) {
      callInWindow('byl', 'track', 'forms');
    }
  }
  data.gtmOnSuccess();
}, data.gtmOnFailure);

___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://back-end.boostyourleads.ca/byl-tag.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "byl"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "isRequired": true
  }
]

___TESTS___

scenarios: []

___NOTES___

Released natively for GTM Community Template Gallery.
