[home](../home.md)
#REST API: Sign In #

User Authentication in The Gazette REST API works based on the [OAuth2.0](http://tools.ietf.org/html/rfc6749) principles using '[Resource Owner Password Credentials](http://tools.ietf.org/html/rfc6749#page-38)’ grant type, which allows the client to exchange a user’s username and password for an access token.

The Gazette REST clients interested in accessing secured resources in The Gazette must obtain OAuth token from the sign-in end point as below.

To access the Gazette OAuth token endpoint your API client must use an appropriate client user name and secret. Please contact TSO customer service to get the Client user name and secret code for accessing the token endpoint.

To obtain The Gazette OAuth token you need to do following:

	Request
	Method : POST 
	URI : https://hostname:port/Gazettes_API/oauth/token 
	Header:	
		Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW  
	Content-Type: application/x-www-form-urlencoded
	Post Params :
		grant_type=password&username=johndoe&password=A3ddj3w

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
To run the sample below you need to have JDK and rest assured jars in class path.
	
		import com.jayway.restassured.RestAssured;
		import com.jayway.restassured.response.Response;
		import com.jayway.restassured.path.json.JsonPath;

		public class RestClient {
		public static void main(String args[])

		{
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
		given().header("Authorization", "Bearer " + accessToken).header("content-type", "text/xml; charset=UTF-8").body(xmlDoc).expect()
			.statusCode(302).when().post("/my-gazette/bundle?legacy=true");

			
		}

	
