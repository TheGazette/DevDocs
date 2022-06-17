[Home](../home.md)

# Delete a saved notice #

Authenticated users can delete notices previously saved to the My Gazette area. For more info, please refer to [creating an account](../authentication/registration.md) and [signing-in](../authentication/sign-in.md).

## Related Resources ##

- [Save a notice](save-notice.md)

## Resource URL ##

`/my-gazette/notice/{notice-id}`

Valid notice Ids can be obtained from the list of the user's saved notices.

- Saved notices via [My Gazette](../mygazette/mygazette.md) (Authentication Required)

<table>
<tr>
<th>URI</th>
<th>Method</th>
<th>Response Type</th>
</tr>
<tr>
<td>/my-gazette/notice/{notice-id}</td>
<td>DELETE</td>
<td>HTTP status code only</td>
</tr>
</table>

## Code Samples ##

### PHP ###
Requires that $noticeId and $headerAuth are defined with appropriate values. The `$headerAuth` variable should be set to `Bearer {bearerToken}` where the bearerToken has been previously obtained ([sign-in](../authentication/sign-in.md)).

	<?php

		$fields = array();
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,				"https://www.thegazette.co.uk/my-gazette/notice/" . $noticeId);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,	true);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION,	false);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");

		$headers = array();
		$headers[] = "Authorization: " . $headerAuth;
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = curl_exec($ch);

		curl_close($ch);
	?>

### Javascript ###
Requires that noticeId and headerAuth are defined with appropriate values. The `headerAuth` variable should be set to `Bearer {bearerToken}` where the {bearerToken} has been previously obtained ([sign-in](../authentication/sign-in.md)).

*with jQuery*

	var headerAuth,
		noticeId
	
	$.ajax({
		type: "DELETE",
		url: "https://www.thegazette.co.uk/my-gazette/notice/" + noticeId,
		beforeSend : setHeader,
		success: success,
		error: error
	});

	function setHeader(xhr) {
	    xhr.setRequestHeader('Authorization', headerAuth);
	}
	function success(data, textStatus, jqXHR){
		//Sucess function fires with 200 status codes
	}
	function error(jqXHR, textStatus, errorThrown){
		//Deal with error responses
	}