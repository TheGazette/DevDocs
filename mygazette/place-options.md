[home](../home.md)
#Place notice options#

These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

## Options to place notices##

This is for html clients only , returns back a list of options to place a notice based on user access level.
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
</tr>
<tr>
	<td>/my-gazette/place-notice</td>
	<td>GET</td>
	<td>HTML</td>
</tr>
</table>

{accept-header} is text/html

<table>
<tr>
	<th>Generic Document URI</th>
	<th>Method</th>
	<th>Response Type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/place-notice</td>
	<td>GET</td>
	<td>HTML</td>
	<td>200</td>
	<td>{accept-header}</td>
</tr>
</table>

**NOTE:** The following URIs are for submission and once bundle/notice has been posted, user can [check the status of submission](notice-submissions.md)

## Sample Responses ##

###XML###
###JSON###



##XML submission##

XML as request body or multipart file upload.
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
	<th>Response code</th>
	<th>Accept header​</th>
</tr>
<tr>
	<td>/my-gazette/bundle</td>
	<td>POST</td>
	<td></td>
	<td>200</td>
	<td>None</td>
</tr>
</table>

## Code samples

### java ###

	final String uri = "https://www.thegazette.co.uk/my-gazette/place-notice";
	HttpClient client = new HttpClient();
	HttpMethod httpGet = new GetMethod(uri);
	
	HttpClientParams params = new HttpClientParams();
	params.setParameter("option", "form");
	client.setParams(params);

	try {
	    int httpStatus = client.executeMethod(httpGet);
	    System.out.println("Http response code: " + httpStatus);
	    
	    InputStream is = httpGet.getResponseBodyAsStream();
		
		// process content in the InputStream
		BufferedInputStream is = new BufferedInputStream(is);
	    int r=0;
	    byte[] buf = new byte[10];
	    while((r = is.read(buf)) > 0) {
	        System.out.write(buf,0,r);
	    }
	    
	} catch (IOException e) {
	    e.printStackTrace();
	} finally {
	    httpGet.releaseConnection();
	}
	