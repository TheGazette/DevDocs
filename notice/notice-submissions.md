[home](../home.md)
# The Gazette Notice Submissions#

These end points are only available to authenticated Users, user needs  to [register](authentication/registration.md) and [sign-in](authentication/sign-in.md).

**TODO: Need endpoints and description for following use cases.**



- Wait for Submission workflow: POST to /my-gazette/bundle, will return with 201 return to Process-status
- Process status: /my-gazette/bundle/1234/process-status, corresponding /data{.format}
- the user stays here until the process is completed
- Formats
  - HTML
  - XML
  - JSON
  - ensure /data.format or with / with appropriate Accept header

- when process completed, this should do return '303 Redirect' to 
  - either /my-gazette/bundle/1234
  - or /notice/{2345234} if uploaded bundle has single notice and that is processed successfuly
  - appropriate location is defined on the header
  - currently returns body with <status><location> elements
- Bundle contents: /my-gazette/bundle/1234
  - should be HTML / XML / JSON / Atom Feed
- Bundle preview: /my-gazette/bundle/1234/preview
