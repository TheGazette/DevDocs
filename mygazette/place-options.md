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

To run the sample below you need to have JDK and [Apache HttpClient](https://hc.apache.org/httpcomponents-client-ga/index.html) on the class path.

	CloseableHttpClient httpClient = HttpClients.createDefault();

	final String uri = "https://www.thegazette.co.uk/my-gazette/place-notice";
	HttpGet httpGet = new HttpGet(uri);
	httpGet.addHeader("Accept", "text/html");
	httpGet.addHeader("Authorization", "Bearer xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

	try {
		HttpResponse response = httpClient.execute(httpGet);
		System.out.println("Http response code: " + response.getStatusLine().getStatusCode());
		System.out.println("Response body: \n" + EntityUtils.toString(response.getEntity()));
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		try {
			httpGet.releaseConnection();
			httpClient.close();
		} catch (IOException e) { 
			System.out.println("unable to close HttpClient at this time"); 
		}
	}
	