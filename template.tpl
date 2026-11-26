___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 3,
  "securityGroups": [],
  "displayName": "BoostYourLeads Official Pixel \u0026 Analytics Tag",
  "brand": {
    "id": "boostyourleads",
    "displayName": "BoostYourLeads"
  },
  "description": "Official Google Tag Manager template for BoostYourLeads (v2.1). Supports multi-brand installation IDs, privacy-safe form metadata, GTM Consent Mode v2, SPA routing, scroll depth, and custom conversion events.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "tagMode",
    "displayName": "Tag Mode",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "init",
        "displayValue": "Initialize BYL Pixel & Auto-Tracking"
      },
      {
        "value": "event",
        "displayValue": "Track Canonical Event (Conversion / Engagement)"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "init"
  },
  {
    "type": "TEXT",
    "name": "clientId",
    "displayName": "BoostYourLeads Installation ID (or Legacy Client ID)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Enter your Brand Tracking Installation ID (e.g. byl_inst_...) from BoostYourLeads Customer Journey Setup."
  },
  {
    "type": "SELECT",
    "name": "environment",
    "displayName": "Environment",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "production",
        "displayValue": "Production"
      },
      {
        "value": "staging",
        "displayValue": "Staging"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "production"
  },
  {
    "type": "TEXT",
    "name": "eventType",
    "displayName": "Event Type (when Tag Mode = Track Canonical Event)",
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "tagMode",
        "paramValue": "event",
        "type": "EQUALS"
      }
    ],
    "help": "Canonical event name such as lead_created, form_success, cta_click, meeting_booked, add_to_cart, checkout_started, or purchase."
  },
  {
    "type": "CHECKBOX",
    "name": "trackPageview",
    "displayName": "Automatically Track Page Views \u0026 SPA Route Changes",
    "checkboxText": "Send a page_view event when this tag fires and on SPA pushState navigation",
    "simpleValueType": true,
    "defaultValue": true,
    "enablingConditions": [
      {
        "paramName": "tagMode",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "trackForms",
    "displayName": "Automatically Track Form Metadata (Zero-PII)",
    "checkboxText": "Capture form_start and form_submit structural metadata without reading or hashing input values",
    "simpleValueType": true,
    "defaultValue": true,
    "enablingConditions": [
      {
        "paramName": "tagMode",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "trackScroll",
    "displayName": "Automatically Track Scroll Depth Milestones (25%, 50%, 75%, 100%)",
    "checkboxText": "Emit scroll_depth engagement milestones",
    "simpleValueType": true,
    "defaultValue": true,
    "enablingConditions": [
      {
        "paramName": "tagMode",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "requireExplicitConsent",
    "displayName": "Require Explicit Consent Before Persisting Analytics",
    "checkboxText": "Block event persistence until analytics_storage is explicitly granted",
    "simpleValueType": true,
    "defaultValue": false,
    "enablingConditions": [
      {
        "paramName": "tagMode",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const callInWindow = require('callInWindow');
const createQueue = require('createQueue');

// Ensure the global queue is initialized safely inside GTM's sandboxed execution
const byl = copyFromWindow('byl');
if (!byl) {
  const queue = createQueue('byl_q');
  setInWindow('byl', function() {
    queue.apply(null, arguments);
  }, true);
}

if (data.tagMode === 'event') {
  if (data.eventType) {
    callInWindow('byl', 'track', data.eventType, { source: 'gtm_template' });
  }
  data.gtmOnSuccess();
} else {
  // Initialize the client configuration via the unified v2.1 SDK contract
  callInWindow('byl', 'init', data.clientId, {
    installationId: data.clientId,
    clientId: data.clientId,
    propertyId: data.clientId,
    environment: data.environment || 'production',
    trackPageview: data.trackPageview !== false,
    trackForms: data.trackForms !== false,
    trackSpa: data.trackPageview !== false,
    trackScroll: data.trackScroll !== false,
    requireExplicitConsent: data.requireExplicitConsent === true
  });

  // Load the core BoostYourLeads tracking script from the canonical collector
  const scriptUrl = 'https://back-end.boostyourleads.ca/byl-tag.js';
  injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, 'byl_pixel_tag');
}


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
                "string": "https://back-end.boostyourleads.ca/*"
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
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "byl" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "byl_q" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
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
  }
]


___TESTS___

scenarios: []


___NOTES___

BoostYourLeads Official GTM Template v2.1 (Multi-Brand, Zero-PII, Consent Mode v2)
