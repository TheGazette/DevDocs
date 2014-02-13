[home](../home.md)
#REST API: Sign In #

User Authentication in The Gazette REST API works based on the [OAuth2.0](http://tools.ietf.org/html/rfc6749) principles using '[Resource Owner Password Credentials](http://tools.ietf.org/html/rfc6749#page-38)’ grant type, which allows the client to exchange a user’s username and password for an access token.

The Gazette REST clients interested in accessing secured resources in The Gazette must obtain OAuth token from the sign-in end point as below.

To access the Gazette OAuth token endpoint your API client must use an appropriate client user name and secret. Please contact TSO customer service to get the Client user name and secret code for accessing the token endpoint.

To obtain The Gazette OAuth token you need to do following:

**TO DO:** Add some notes on the Authorization header value i.e. how the client should generate and using the API client credentials. 

## Resource URL ##

`/oauth/token`

HTTP status code should be used an indicator to success, a 200 return code is

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

##Parameters##
<table>
<tr>
<th>Parameter</th>
<th></th>
</tr>
<tr>
<td>username</td>
<td></td>
</tr>
<tr>
<td>password</td>
<td></td>
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

##Sample Response##
###JSON###
Success (200 Status Code)
	
	{  
		"access_token":"xxxxxxxxxxxxxxxxxxxxxxxxxx",  
		"token_type":"bearer",  
		"expires_in":3600,  
		"refresh_token":"yyyyyyyyyyyyyyyyyyyyyyyyy"
	}
Failure	(400 Status Code)

	{
		"error":"invalid_request",
		"error_description":"zzzzzzzzzzzzzzzzzzzzzzzzz"
	}

##Code Samples##

###Java###
To run the sample below you need to have JDK and rest assured jars in class path.
	
	import com.jayway.restassured.RestAssured;
	import com.jayway.restassured.response.Response;
	import com.jayway.restassured.path.json.JsonPath;

	public class RestClient {
		public static void main(String args[]){
			RestAssured.baseURI = "https://www.thegazette.co.uk";
			final Map<String, String> params = new HashMap<String, String>();
			params.put("grant_type", "password");
			params.put("username", "-----");
			params.put("password", "----");
			params.put("scope", "trust");
		
			Response response = given().header("Authorization", "Basic dHNvOkphdmEkY3IxcHQh").expect().statusCode(200).when()
				.post("/oauth/token");
	
			String body = response.getBody().asString();
			JsonPath jsonPath = new JsonPath(body);
			accessToken = jsonPath.getString("access_token");


			//the above access_token can be used in subsequent request to access any secured resource , must hold the access token(accessToken) in ‘Authentication’ HTTP request header for example :
			String xmlDoc = "bundle that needs to be posted";
			given().header("Authorization", "Bearer " + accessToken).header("content-type", "text/xml; charset=UTF-8").body(xmlDoc).expect().statusCode(302).when().post(endpoint);
		}
	}

	
###php###
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
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,	false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,	false);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION,	false);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($fields));
		

		$headers = array();
		$headers[] = "Authorization: " . $headerAuth;
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = curl_exec($ch);

		curl_close($ch);
	?>

###Javascript###
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