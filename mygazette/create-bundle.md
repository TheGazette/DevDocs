[home](../home.md)
#Create Bundle#
For submission routes which allow multiple notice to be submitted at once (XML, JSON, Excel) the submission is made in the form of a bundle. 

These end points are only available to authenticated users with permission to place notices, user needs  to [register](../authentication/registration.md) as either an individual or an organisation and then [sign-in](../authentication/sign-in.md).

The type of user registered will affect the ability of that user to place notices of different types and also the ability to place notice utilising different routes.

## Resource URL ##

`my-gazette/bundle`

See also

- [Existing Bundle](existing-bundle.md)
- [HTML5+RDFa notice creation](notice-submit)

Content to be process should be included either in the request body or multipart file upload.

<table>
<tr>
	<th>URI</th>
	<th>Method</th>
	<th>Request Type</th>
	<th>Notes</th>
</tr>
<tr>
	<td rowspan=7>/my-gazette/bundle</td>
	<td rowspan=7>POST</td>
	<td>text/xml<br />
application/xml</td>
	<td>Gazettes Markup Language xml document</td>
</tr>
<tr>
	<td>application/msword<br />
application/vnd.openxmlformats-officedocument.wordprocessingml.document
</td>
	<td>Notices based upon the The Gazette Microsoft Word Template*</td>
</tr>
<tr>
	<td>text/csv</td>
	<td><a href="templates/2903.csv">Template(s) available</a>, for notice type 2903 only</td>
</tr>
<tr>
	<td>application/vnd.ms-excel</td>
	<td><a href="templates/2903.xls">Template(s) available</a>, for notice type 2903 only</td>
</tr>
<tr>
	<td>application/json</td>
	<td><a href="templates/2903.json">Template(s) available</a>, for notice type 2903 only</td>
</tr>
<tr>
	<td>application/rdf</td>
	<td><a href="templates/2903.rdf">Template(s) available</a>, for notice type 2903 only</td>
</tr>
<tr>
	<td>text/html<br />application/xhtml+xml</td>
	<td>Template(s) available</td>
</tr>
</table>



\**Microsoft Word template upload is only available on request*

##XML submission##





## Sample request ##



## Sample responses ##

##Code Samples##

### java ###
	
	final String uri = "https://test.thegazette.co.uk/my-gazette/bundle";
	HttpClient client = new HttpClient();
	
	HttpMethod httpPost = new PostMethod(uri);
	httpPost.addRequestHeader("Content-Type", "text/xml; charset=UTF-8");
	
	try {
	    InputStream is = new FileInputStream("post-bundle.xml");
	    RequestEntity requestEntity = new InputStreamRequestEntity(is);
	    ((PostMethod)httpPost).setRequestEntity(requestEntity);
	} catch (FileNotFoundException e1) {
	    e1.printStackTrace();
	}
	
	
	try {
	    int httpStatus = client.executeMethod(httpPost);
	    System.out.println("Http response code: " + httpStatus);
	    
	    BufferedInputStream is = new BufferedInputStream(httpPost.getResponseBodyAsStream());
	    int r=0;
	    byte[] buf = new byte[10];
	    while((r = is.read(buf)) > 0) {
	        System.out.write(buf,0,r);
	    }
	    
	} catch (IOException e) {
	    e.printStackTrace();
	} finally {
	    httpPost.releaseConnection();
	}