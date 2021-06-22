[Home](../home.md)

# Placing an order: overview

Via the Gazette APIs, it is possible to place notices and arrange for the payment of their publication.

## Prerequisites

### Register an account
These end points are only available to authenticated Users, user needs  to [register](../authentication/registration.html) and [sign-in](../authentication/sign-in.html).

### User associated with a credit account

The registered user needs to be associated with a credit account. To check whether the user has a credit account, check the for the presence of the `credit-account-request-status` field in the user's [account details](../mygazette/mygazette.md#my-account-settings). 

If the user isn't associated with a credit account, they will need to contact TSO customer service in order to get this set up.


## Workflow

The following are the steps required to place a notice and complete the checkout process.

### Place notice 

The first step is to upload the details of the notice(s) to be published. 

Details: [Place notice](../mygazette/create-bundle.md)

### Check processing status 

Once the notice details have been uploaded, the processing of the notice bundle occurs asynchronously. 

It is only possible to proceed with the checkout process if all notices in the uploaded bundle have been processed without any validation errors.
As such, it is necessary to periodically check whether the notice(s) have been processed successfully.

Details: [Bundle status](../mygazette/bundle-status.md)

### Add notice / bundle to the basket

Once the bundle has been successfully processed, you will need to add items to the user's basket. Individual notices or the entire bundle can be added to the basket.

Details: [Add to basket](add-to-basket.md)

### Checkout

It is necessary to confirm the payment method the user wishes to proceed with. At present, the only option available is via purchase order.

Details: [Checkout](checkout.md)

### Assign purchase order number

A purchase order number will need to be assigned to the order before it can be finalised. This can be any number up to 10 digits in length.

Details: [Assign purchase order number](../mygazette/order/assign-po-number.md)

### Confirm

The final step is to confirm the submission of the order.

Details: [Confirm order](../mygazette/order/confirm.md)
