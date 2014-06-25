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
	<th></th>
</tr>
<tr>
	<td rowspan=7>/my-gazette/bundle</td>
	<td rowspan=7>POST</td>
	<td>text/xml<br />
application/xml</td>
	<td>Gazettes Markup Language xml document</td>
	<td><a href="#xml-submission">further information</a></td>
</tr>
<tr>
	<td>application/msword<br />
application/vnd.openxmlformats-officedocument.wordprocessingml.document
</td>
	<td>Notices based upon the The Gazette Microsoft Word Template*</td>
	<td></td>
</tr>
<tr>
	<td>text/csv</td>
	<td><a href="templates/2903.csv">Template(s) available</a>, for notice type 2903 only</td>
	<td></td>
</tr>
<tr>
	<td>application/vnd.ms-excel</td>
	<td><a href="templates/2903.xls">Template(s) available</a>, for notice type 2903 only</td>
	<td><a href="#excel-submission">further information</a></td>
</tr>
<tr>
	<td>application/json</td>
	<td><a href="templates/2903.json">Template(s) available</a>, for notice type 2903 only</td>
	<td></td>
</tr>
<tr>
	<td>application/rdf</td>
	<td><a href="templates/2903.rdf">Template(s) available</a>, for notice type 2903 only</td>
	<td></td>
</tr>
<tr>
	<td>text/html<br />application/xhtml+xml</td>
	<td>Template(s) available</td>
	<td></td>
</tr>
</table>



\**Microsoft Word template upload is only available on request*



##XML submission##

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

##Excel submission##

##Sample responses##

##Code Samples##
	
### php ###
The following code sample demonstrates how to  assumes an install of php with cURL enabled and that the following variables have been set:
<dl>
<dt>$access_token</dt><dd>A valid OAuth access token requested by following the sign-in proceedure</dd>
<dt>$localFile</dt><dd>A completed xls template store referenced by path in the local filesystem</dd>
</dl>
	<?php		
		$api_endpoint = "https://www.thegazette.co.uk/my-gazette/bundle";

		//Construct the post fields
		$post_fields = array('file'=>'@'.$localFile);
				
		// Connecting to website.
		$ch = curl_init();
		
		$headers = array();
		$headers[]= "Authorization: bearer " . $access_token;
		
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
				
		curl_setopt($ch, CURLOPT_URL, $api_endpoint);
		curl_setopt($ch, CURLOPT_POST,1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_fields);
		
		// Don't follow redirection instead report back the headers
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION,	false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, 1);
		
		$response = @curl_exec($ch);
		if(curl_errno($ch)){
		    echo 'Curl error: ' . curl_errno($ch).'\n';
		}
		
		$header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
		$header = substr($response, 0, $header_size);
		$body = substr($response, $header_size);
		$headers_array = explode("\n",$header);
		
		//Convert the raw headers into an associative array
		$headers = array();
		foreach ($headers_array as $value) {
			if(strpos($value,":") !== false){
				list($k,$v) = explode(":",$value);
				$headers[trim($k)] = trim($v);
			}elseif(!trim($value)){
		
			}elseif(preg_match("#HTTP/\d\.\d (\d*) (.*?)$#",$value,$m)){
				$headers["Response-Code"] = $m[1];
			}
		}
		
		if($headers["Response-Code"] == 201){
			//The bundle has successfully been created at the following location
			print "bundle-uri:" . $headers["Location"];
		}else{
			//Resolve any issues related to unsuccessful submission
		}
		curl_close($ch);
	?>