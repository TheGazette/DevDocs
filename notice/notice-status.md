[home](../home.md)
#The Gazette Notice  - Status#

The users can change the status of their unpublished notices, in order to do this they must be authenticated, [register](../authentication/registration.md) and [sign-in](../authentication/sign-in.md).

## Resource URL ##

`/notice/{notice-id}/status`
 
Ids for the user's own unpublished notices can be found using:

- [My Gazette](../my-gazette/my-gazette.md)

### Alternative Representations ###
Due to the large number of alternative representations available there is a notes column to help guide the user to the appropriate representation.

<table>
<tr>
<th>Representation URI</th>
<th>Method</th>
<th>Response type</th>
</tr>
<tr>
<td>​​/notice/{notice-id}/status</td>
<td>PUT</td>
<td>HTML</td>
</tr>
</table>


## Parameters ##
<table>
<tr>
<td rowspan=2 style="width:12em">withdraw</td>
<td>Mark a notice as withdrawn, this is only an allowable action for notices which have been purchased but are yet to be published</td>
</tr>
<tr>
<td><b>Valid value:</b> true</td>
</tr>
<tr>
<td rowspan=2 >exclude</td>
<td>Used to marks a notice as either excluded or to reverse this action. Excluding a notice removes a notice from its containing bundle for the purposes of the notice submission route.
This is only possible when a notice has a status of <i>status</i>
</td>
</tr>
<tr>
<td><b>Valid values:</b> true or false</td>
</tr>
</table>

## Sample Responses ##


## Code Samples ##

###	java ###
	// with accept header
	import com.jayway.restassured.RestAssured;
	import com.jayway.restassured.response.Response;
	public class RestClient {
		public static void main(String args[])
		{
			// get the access token via POST explained in Sign-in document.
		   	RestAssured.baseURI = "https://www.thegazette.co.uk";
		   	
		   	Response response = given().header("Authorization", "Bearer " + accessToken).header("Accept", "application/rdf+xml").expect().statusCode(200).get("/notice/{notice-id}");
			String asString = response.getBody().asString();
	    }
	
	}
	
	// without accept header
	import com.jayway.restassured.RestAssured;
	import com.jayway.restassured.response.Response;
	public class RestClient {
		public static void main(String args[])
		{
			// get the access token via POST explained in Sign-in document.
		   	RestAssured.baseURI = "https://www.thegazette.co.uk";
	
	    	Response response = given().expect().statusCode(200).get("/notice/{notice-id}");
			String asString = response.getBody().asString();
	    }

	}



### php ###

### javascript ###
