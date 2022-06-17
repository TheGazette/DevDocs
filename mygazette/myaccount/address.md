# Account - Change Address #

This allows a user to change the address which their account is registered to requires the user to be authenticated. To be authenticated users must [create an account](../authentication/registration.md) and then [sign-in](../authentication/sign-in.md).

## Resource URL ##

`/my-gazette/account/address`


<table>
<tr>
<th>URI</th>
<th>Method</th>
<th>Response Type</th>
</tr>
<tr>
<td>/my-gazette/account/address<br />/my-gazette/account/address/data.htm</td>
<td rowspan=3>GET</td>
<td>(X)HTML5+RDFa</td>
</tr>
<td>/my-gazette/account/address/data.json</td>
<td>JSON</td>
</tr>
<td>/my-gazette/account/address/data.xml</td>
<td>XML</td>
</tr>
<tr>
<td>/my-gazette/account/address</td>
<td>POST</td>
<td>JSON</td>
</tr>
</table>

## Sample Response ##
### XML ###
	<?xml version="1.0" encoding="UTF-8"?>
	<user xmlns="http://www.gazettes.co.uk/assets/user" 
		  xmlns:f="https://www.thegazette.co.uk/facets" 
		  xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" 
          xmlns:openSearch="http://a9.com/-/spec/opensearch/1.1/">
		<user-id>72</user-id>
		<administrator>false</administrator>
		<upload-word-template>false</upload-word-template>
		<verify-company-no>false</verify-company-no>
		<verify-law-soc-id>false</verify-law-soc-id>
		<verify-assoc-ref>false</verify-assoc-ref>
		<verify-email>false</verify-email>
		<verify-business-nature>false</verify-business-nature>
		<verify-local-authority>false</verify-local-authority>
		<verify-website>false</verify-website>
		<facebook-user>false</facebook-user>
		<title>xxxxxxxxxx</title>
		<name>xxxxxxxxxxx</name>
		<familyName>xxxxxxxx</familyName>
		<givenName>xxxxxxxxxx</givenName>
		<email>xxxxxxxx</email>
		<newsletter>false</newsletter>
		<addressLine1>St. Crispin's House</addressLine1>
		<addressLine2>33 King St</addressLine2>
		<locality>Norwich</locality>
		<county/>
		<country/>
		<postcode>NR1 1PD</postcode>
		<type>research</type>
		<customerId>20</customerId>
		<customerGroup>2</customerGroup>
		<images/>
		<basketId>xxxxxxxxxxxxxxxxxxxxxx</basketId>
	</user>

### JSON ###

	{
	    "@xmlns": "http://www.gazettes.co.uk/assets/user",
	    "@xmlns:f": "https://www.thegazette.co.uk/facets",
	    "@xmlns:geo": "http://www.w3.org/2003/01/geo/wgs84_pos#",
	    "@xmlns:openSearch": "http://a9.com/-/spec/opensearch/1.1/",
	    "user-id": "72",
	    "administrator": "false",
	    "upload-word-template": "false",
	    "verify-company-no": "false",
	    "verify-law-soc-id": "false",
	    "verify-assoc-ref": "false",
	    "verify-email": "false",
	    "verify-business-nature": "false",
	    "verify-local-authority": "false",
	    "verify-website": "false",
	    "facebook-user": "false",
	    "title": "XXXXX",
	    "name": "XXXXXXX",
	    "familyName": "XXXXXXXX",
	    "givenName": "Test",
	    "email": "XXXXXXXXXXX",
	    "newsletter": "false",
	    "addressLine1": "St. Crispin's House",
	    "addressLine2": "33 King St",
	    "locality": "Norwich",
	    "county": null,
	    "country": null,
	    "postcode": "NR1 1PD",
	    "type": "research",
	    "customerId": "20",
	    "customerGroup": "2",
	    "images": null,
	    "basketId": "XXXXXXXXXXXXXXXXXXXXXX"
	}