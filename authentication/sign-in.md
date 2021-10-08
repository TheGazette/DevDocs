[Home](../home.md)
# REST API: Sign In

User Authentication in The Gazette REST API works based on the [OAuth2.0](http://tools.ietf.org/html/rfc6749) principles using '[Resource Owner Password Credentials](http://tools.ietf.org/html/rfc6749#page-38)’ grant type, which allows the client to exchange a user’s username and password for an access token.

In order to access secured resources in The Gazette, REST clients must obtain OAuth token from the sign-in end point as below.

## Prerequisites

To access the Gazette OAuth token endpoint, your API client must use an appropriate Basic authentication token. Please contact TSO customer service to get the Basic authentication token for accessing the token endpoint.

## Resource URL ##

`/oauth/token`

<table>
<tr>
<th>URI</th>
<th>Method</th>
<th>Response Type</th>
<th>Notes</th>
</tr>
<tr>
<td>/oauth/token</td>
<td>POST</td>
<td>JSON</td>
<td></td>
</tr>
</table>

## Parameters
<table>
<tr>
<th>Parameter</th>
<th></th>
</tr>
<tr>
<td>username</td>
<td>valid username (email)</td>
</tr>
<tr>
<td>password</td>
<td>password for the account</td>
</tr>
<tr>
<td rowspan=2>grant_type</td>
<td>Only one value is allowable</td>
</tr>
<tr>
<td><b>Value:</b> password</td>
</tr>
<tr>
<td rowspan=2>scope</td>
<td>Only one value is allowable</td>
</tr>
<tr>
<td><b>Value:</b> trust</td>
</tr>
</table>

## Headers

To get a basic auth token, please refer to [Prerequisites](sign-in.md#prerequisites).

<table>
<tr>
<th>Header</th>
<th>Value</th>
</tr>
<tr>
<td>Authorization</td>
<td>Basic {basic-auth-token}</td>
</tr>
</table>

## Sample Response
### JSON
Success (200 Status Code)
	
	{  
		"access_token": "xxxxxxxxxxxxxxxxxxxxxxxxxx",  
		"token_type": "bearer",  
		"expires_in": 3600,  
		"scope": "trust"
	}
	
Failure	(400 Status Code)

	{
		"error":"invalid_request",
		"error_description":"yyyyyyyyyyyyyyyyyyyyyyyyy"
	}
	
## Using the OAuth token to authenticate

Once a successful [response](sign-in.md#sample-response) has been received from the end point, the client will be able to include the provided OAuth token on any API end points which require the client to authenticate:

<table>
<tr>
<th>Header</th>
<th>Value</th>
</tr>
<tr>
<td>Authorization</td>
<td>Bearer {access_token}</td>
</tr>
</table>

## Code Samples

### Java
To run the sample below you need to have JDK and [Apache HttpClient](https://hc.apache.org/httpcomponents-client-ga/index.html) on the class path.
	
	CloseableHttpClient httpClient = HttpClients.createDefault();

	HttpPost httpPost = new HttpPost("https://www.thegazette.co.uk/oauth/token");
	httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded");
	httpPost.addHeader("Authorization", "Basic tttttttttttttttttttt");

	try {
		final String body = "username=person@email.com&password=passWord&grant_type=password&scope=trust";
		StringEntity entity = new StringEntity(body);
		httpPost.setEntity(entity);

		HttpResponse response = httpClient.execute(httpPost);
		System.out.println("Http response code: " + response.getStatusLine().getStatusCode());
		System.out.println("Response body: \n" + EntityUtils.toString(response.getEntity()));
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		try {
			httpPost.releaseConnection();
			httpClient.close();
		} catch (IOException e) {
			System.out.println("unable to close HttpClient at this time");
		}
	}
	
### PHP

Requires that $username,$password,$headerAuth are defined with appropriate, requires a [php installation with cURL](https://php.net/curl) to be enabled.
`$headerAuth` should be set to `Basic dHNvOkphdmEkY3IxcHQh`.

	<?php

		$fields = array();
		$fields["grant_type"] = "password";
		$fields["username"] = $username;
		$fields["password"] = $password;
		$fields["scope"] = "trust";

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,				"https://www.thegazette.co.uk/oauth/token");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,	true);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION,	false);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($fields));
		

		$headers = array();
		$headers[] = "Authorization: " . $headerAuth;
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = curl_exec($ch);

		curl_close($ch);
	?>

### Javascript
Requires that username, password and headerAuth are defined with appropriate values. The `headerAuth` variable should be set to `Basic dHNvOkphdmEkY3IxcHQh`.

*with jQuery*

	var username,
		password,
		headerAuth,
		token,
		data = {"grant_type":"password","username":username,"password":password,"scope":"trust"}
	
	$.ajax({
		type: "POST",
		url: "https://www.thegazette.co.uk/oauth/token",
		data: data,
		beforeSend : setHeader,
		success: success,
		dataType: "json"
	});

	function setHeader(xhr) {
	    xhr.setRequestHeader('Authorization', headerAuth);
	}
	function success(data, textStatus, jqXHR){
		token = data.access_token;
		//user token in future requests
	}