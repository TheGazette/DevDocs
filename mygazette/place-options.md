[Home](../home.md)
# Place notice options #

This end points is only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

## Options to place notices ##

Returns a list of options for [placing a notice](create-bundle.md) based on user access level.

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
	<td>text/html</td>
</tr>
</table>

## Code samples

### Java ###

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
	