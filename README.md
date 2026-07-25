# BoostYourLeads Tag Template for Google Tag Manager

The official Google Tag Manager (GTM) custom template for the **BoostYourLeads Pixel**. This template allows you to implement web attribution, B2B firmographics resolution, and automated lead scoring natively on your website.

---

## Features

- **Automated Pageview Tracking**: Automatically capture traffic sources, referral links, and UTM campaigns.
- **Form Capture Integration**: Safely capture form submission fields (excluding sensitive data) to enrich lead profiles.
- **B2B Firmographics**: Identify organizational visits and firm details based on visitor IP address.
- **Permission-Centric Sandbox**: Built natively using Google Tag Manager's sandboxed APIs (`injectScript`, `callInWindow`) for fast execution and compliance with security policies.

---

## Installation

You can install this template directly from the [GTM Community Template Gallery](https://tagmanager.google.com/gallery):

1. Inside Google Tag Manager, navigate to **Templates** -> **Search Gallery**.
2. Search for **BoostYourLeads Pixel**.
3. Click **Add to workspace**.

---

## Configuration

Once added to your workspace, create a new tag using the **BoostYourLeads Pixel** template:

1. **Client ID (Required)**: Enter your unique BYL Account Identifier, found in your Co-Pilot settings portal.
2. **Automatically Track Pageviews (Optional)**: Check to send pageview events automatically as users navigate your site.
3. **Automatically Capture Form Fills (Optional)**: Check to automatically attribute form submissions for B2B scoring.
4. **Triggering**: Set your trigger to fire on **All Pages** (Initialization or Page View).

---

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
