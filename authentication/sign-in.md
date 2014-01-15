[home](../home.md)
#REST API: Sign In #

User Authentication in The Gazette REST API works based on the [OAuth2.0](http://tools.ietf.org/html/rfc6749) principles using '[Resource Owner Password Credentials](http://tools.ietf.org/html/rfc6749#page-38)’ grant type, which allows the client to exchange a user’s username and password for an access token.

The Gazette REST clients interested in accessing secured resources in The Gazette must obtain OAuth token from the sign-in end point as below.

To access the Gazette OAuth token endpoint your API client must use an appropriate client user name and secret. Please contact TSO customer service to get the Client user name and secret code for accessing the token endpoint.

To obtain The Gazette OAuth token you need to do following:

POST /oauth/token HTTP/1.1  
Host: server.example.com  
Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW  
Content-Type: application/x-www-form-urlencoded
grant_type=password&username=johndoe&password=A3ddj3w

**TO DO:** Add some notes on the Authorization header value i.e. how the client should generate and using the API client credentials. 

**Possible Outcomes :** 
<table>
<tr>
<th>Response status codes</th>
<th>Description</th>
</tr>
<tr>
	<td>400</td>
	<td>Bad request</td>
</tr>
<tr>
	<td>401</td>
	<td>Unauthorized</td>
</tr>
<tr>
	<td>403</td>
	<td>Forbidden</td>
</tr>

<tr>
	<td>200</td>
	<td>OK</td>
</tr>
</table>

**TO DO:** What does the response body contain? How to access the returned token?


##Example Java code##
	

	
	Resquest:
	RestAssured.baseURI = Util.loadProperties().getProperty("api.server.url");
		Response response = given().header("Authorization", "Basic dHNvOkphdmEkY3IxcHQh").expect().statusCode(200).when()
			.get("/oauth/token?grant_type=password&username=aruna.klr@gmail.com&password=Iphone4s123$&scope=trust");
	
		String body = response.getBody().asString();
	
		JsonPath jsonPath = new JsonPath(body);
		accessToken = jsonPath.getString("access_token");
	
	Response:  
	HTTP/1.1 200 OK      
	Content-Type: application/json;charset=UTF-8      
	Cache-Control: no-store      
	Pragma: no-cache       
	{  
	"access_token":"xxxxxxxxxxxxxxxxxxxxxxxxxx",  
	"token_type":"bearer",  
	"expires_in":3600,  
	"refresh_token":"yyyyyyyyyyyyyyyyyyyyyyyyy”  
	}
	
		
	Subsequent requests: To access any secured resource must hold the access token in ‘Authentication’ HTTP request header.
	
	String xmlDoc = IOUtils.toString(ClassLoader.getSystemResourceAsStream("notices/post2005.xml"), "UTF-8");
		given().header("Authorization", "Bearer " + accessToken).header("content-type", "text/xml; charset=UTF-8").body(xmlDoc).expect()
			.statusCode(302).when().post("/my-gazette/bundle?legacy=true");
