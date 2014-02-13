# The Gazette Web Service Interface #  

The Gazette REST API allows you to access The Gazette notice feeds, notice documents, PDF publications and various other public resources. The API also allows clients to Place notices in The Gazette using a registered user account.

Since the API is based on REST principles, it's very easy to write and test applications. You can use your browser to access URLs, and you can use pretty much any HTTP client in any programming language to interact with the API.

## Base URL ##

All URLs referenced in the documentation have the following base:

<pre>https://www.thegazette.co.uk</pre>

The Gazettes REST API is served over HTTPS. To ensure data privacy, unencrypted HTTP is not supported.

## The Gazette resources ##

Gazettes have the following resources. Click on a link to read the API documentation for accessing or modifying each resource.

**Publishing Service**

* [The Gazette notice feeds](notice/notice-feed.md)
* [The Gazette notice documents](notice/notice.md)
* [The Gazette PDF publication](publication/pdf-publication.md)

 
**Registration and user authentication**

* [Register to access The Gazette API](authentication/registration.md)
* [Sign-In to The Gazette API](authentication/sign-in.md)

**Place notice in The Gazette**

* [Notice taxonomy](notice/notice-taxonomy.md)
* [Place notice options](notice/place-options.md)  
* [Submission and asynchronous process](notice/notice-submissions.md) 
* [Add to basket](basket/add-to-basket.md) 
* [Checkout](basket/checkout.md) 


**Manage 'My Gazette' resources**

* [My Gazette Area](mygazette/mygazette.md) 

**SPARQL end point**

* [End points](sparql/sparql.html)
* [Sample queries](sparql/sample-queries.md) 

**Longitudinal Datasets**

* [Datasets](datasets/datasets.md) 



## License ##

All content is available under the Open Government Licence v2.0 except where otherwise stated
	
	(c) Crown copyright
	You may use and re-use the code in this repository free of charge under the terms of the Open Government Licence
	http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2

For more information on the please visit [the national archives open government licence explanation](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2) page
