[home](../home.md)
#Existing Bundle#
Once a bundle has been created it can be accessed and deleted by the user who created it.
These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

## Resource URL ##
`my-gazette/bundle/{bundle-id}`

Valid bundle Ids can be found using:

- [Bundle]()


See also

- [Create Bundle](create-bundle.md)
- [Add a Bundle to the Basket](../basket/add-to-basket.md)

###Available methods###

<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Response type</th>
</tr>
<tr>
	<td rowspan=2>/my-gazette/bundle/{bundle-id}</td>
	<td>GET</td>
	<td>HTML</td>
</tr>
<tr>
	<td>DELETE</td>
	<td></td>
</tr>
</table>


###Alternative Representations###
<table>
<tr>
	<th>Representation URI</th>
	<th>Method</th>
	<th>Accepts header</th>
<th>Response type</th>
</tr>
<tr>
	<td rowspan=7>/my-gazette/bundle/{bundle-id}</td>
	<td rowspan=6>GET</td>
	<td>application/xml</td>
	<td rowspan=2>XML (Atom)</td>
</tr>
<tr>
<td>application/atom+xml</td>
</tr>
<tr>
<td>application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>text/html</td>
<td rowspan=3>(X)HTML5+RDFa</td>
</tr>
<tr>
<td>application/xhtml+xml</td>
</tr>
<tr>
<td>*/*</td>
</tr>
</table>

## Sample responses ##
###XML (Atom)###
###JSON###



##Code samples##
###java###

Retrieving the content of an exisiting bundle

	final String uri = "https://www.thegazette.co.uk/my-gazette/bundle/76838";
	HttpClient client = new HttpClient();
	HttpMethod httpGet = new GetMethod(uri);
	
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
	