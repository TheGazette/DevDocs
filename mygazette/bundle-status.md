[home](../home.md)
#Bundle Status#
Once a [bundle has been submitted](create-bundle.md) this starts an Asynchronous process whereby the bundle is transformed into notices and validated as containing the correct information.

This end point is only available to authenticated users with permission to place notices, user needs  to [register](../authentication/registration.md) as either an individual or an organisation and then [sign-in](../authentication/sign-in.md).

The registered user is only able to check the status of their own bundles

## Resource URL ##

`my-gazette/bundle/{bundleId}/process-status`

See also

- [Existing Bundle](existing-bundle.md)
- [List of Draft notices](mygazette.md)

## Sample responses ##
### JSON ###
####An in-progress bundle####

	{
	    "process-status": "in-progress",
	    "total-notice-count": "100",
	    "processed-notice-count": "1",
	    "error-count": "0",
	    "links": {
	        "@xmlns": "http://www.w3.org/1999/xhtml",
	        "link": [
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle",
	                "@rel": "prev",
	                "@title": ""
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}",
	                "@rel": "next",
	                "@title": ""
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.xml",
	                "@rel": "alternate",
	                "@title": "XML"
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.html",
	                "@rel": "alternate",
	                "@title": "HTML"
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.json",
	                "@rel": "self",
	                "@title": "JSON"
	            }
	        ]
	    }
	}
####A completed bundle####

	{
	    "process-status": "completed",
	    "total-notice-count": "1",
	    "processed-notice-count": "1",
	    "error-count": "0",
	    "links": {
	        "@xmlns": "http://www.w3.org/1999/xhtml",
	        "link": [
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle",
	                "@rel": "prev",
	                "@title": ""
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}",
	                "@rel": "next",
	                "@title": ""
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.xml",
	                "@rel": "alternate",
	                "@title": "XML"
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.html",
	                "@rel": "alternate",
	                "@title": "HTML"
	            },
	            {
	                "@href": "https://test.thegazette.co.uk/my-gazette/bundle/{bundle-id}/process-status/data.json",
	                "@rel": "self",
	                "@title": "JSON"
	            }
	        ]
	    }
	}

##Code Samples##
