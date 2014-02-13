[home](../home.md)
#The Gazette Notice Taxonomy#

Used to retrieve a list of notices which can be placed by the current user.
These end points are only available to authenticated users ([authentication](../authentication/sign-in.md)).

## Resource URL ##

`/notice-taxonomy/`

or

`/notice-taxonomy/{notice-category-code}`

Notice category code can be replaced by either a 2 digit category code or a subcategory code. The subcategory codes are 

### Alternative Representations ###

Alternative representations of notice feeds can be retrieved by utilising either representation specific filenames or via content negotiation.
In each instance the base URI can be either `/notice-taxonomy/` or  `/notice-taxonomy/{notice-category-code}`.

<table>
<tr>
<th style="width:12em">Representation URI</th>
<th>Method</th>
<th>Response type</th>
</tr>
<tr>
<td>/notice-taxonomy/data.xml</td>
<td rowspan=2>GET</td>
<td>XML</td>
</tr>
<tr>
<td>/notice-taxonomy/data.json</td>
<td>JSON</td>
</tr>
</table>

#### Content Negotiation ####
<table>
<tr>
<th style="width:12em">Generic Document URI</th>
<th>Method</th>
<th>Accept header​</th>
<th>Response format</th>
</tr>
<tr>
<td rowspan=3>/notice-taxonomy/</td>
<td rowspan=3>GET</td>
<td>application/xml</td>
<td>XML</td>
</tr>
<tr>
<td>​​application/json</td>
<td>JSON</td>
</tr>
<tr>
<td>*/*</td>
<td>XML</td>
</tr>
</table>

## Parameters ##

<table>
<tr>
<td rowspan=2 style="width:12em">online-form-edition</td>
<td>limits the returned taxonomy to those notices which can be placed by the user, on a per edition basis</td>
</tr>
<tr>
<td><b>Example Values:</b> london, edinburgh or belfast</td>
</tr>
</table>  
- (above exists currently but parameter is named different)

</table>

## Sample Responses ##
The results from this endpoint are available as either xml or json. Below are samples of responses from both the 3 level portion of the taxonomy and also the 2 level portion of the taxonomy.

	https://www.thegazette.co.uk/notice-taxonomy/24/data.xml?online-edition-form=london
	https://www.thegazette.co.uk/notice-taxonomy/29/data.xml?online-edition-form=london

### XML ###

#### 3 level example ####

	<notice-taxonomy xmlns="http://www.gazettes.co.uk/assets/taxonomy">
	    <notice-type code="24" level="category" name="Corporate Insolvency" popular="true" service-key="insolvency" sort="15">
	        <notice-type code="2400/5" level="section" name="Winding-up By The Court" sort="06">
	            <notice-type blockable="true" code="2450" level="notice" name="Petitions to Wind Up (Companies)" sort="50" template="true"/>
	        </notice-type>
	    </notice-type>
	</notice-taxonomy>

#### 2 level example ####

	<notice-taxonomy xmlns="http://www.gazettes.co.uk/assets/taxonomy">
	   <notice-type code="29" level="category" name="Personal Legal" popular="true" service-key="wills-and-probate" sort="20">
	      <notice-type code="2903" level="notice" name="Deceased Estates" sort="03"/>
	   </notice-type>
	</notice-taxonomy>

### JSON ###

#### 3 level example ####

	{
	    "@xmlns": "http://www.gazettes.co.uk/assets/taxonomy",
	    "notice-type": {
	        "@code": "24",
	        "@level": "category",
	        "@name": "Corporate Insolvency",
	        "@popular": "true",
	        "@service-key": "insolvency",
	        "@sort": "15",
	        "notice-type": [
	            {
	                "@code": "2400/5",
	                "@level": "section",
	                "@name": "Winding-up By The Court",
	                "@sort": "06",
	                "notice-type": [
	                    {
	                        "@blockable": "true",
	                        "@code": "2450",
	                        "@level": "notice",
	                        "@name": "Petitions to Wind Up (Companies)",
	                        "@sort": "50",
	                        "@template": "true"
	                    }
	                ]
	            }
	        ]
	    }
	}

#### 2 level example ####

	{
	    "@xmlns": "http://www.gazettes.co.uk/assets/taxonomy",
	    "notice-type": {
	        "@code": "29",
	        "@level": "category",
	        "@name": "Personal Legal",
	        "@popular": "true",
	        "@service-key": "wills-and-probate",
	        "@sort": "20",
	        "notice-type": {
	            "@code": "2903",
	            "@level": "notice",
	            "@name": "Deceased Estates",
	            "@sort": "03"
	        }
	    }
	}