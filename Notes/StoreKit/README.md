# StoreKit 
> Support in-app purchases and interaction with the AppStore

## Supported Features

**In-App Purchases** - Offer and promote in-app purchases for content and services.

**App transactions** - Verify the customer's app purchases with an App Store Signed transaction.

**Ad Network attribution** - Validate advertisement driven installations

**Recommendations** - Provide recommendations for third party content.

**Reviews** - Request app store reviews and ratings from your customers.

**Messages** - Display App Store messages in your app.


- - -

## Request App Store Reviews

**SKStoreReviewController** is an object that controls the process of requesting a reviews and ratings from a user.

```swift
class SKStoreReviewController: NSObject
```

Use the **requestReview(in:)** method to indicate when it makes sense within the logic of your application to request for a rating or review.

```swift
@MainActor class func requestReview(in windowScene: UIWindowScene)
```

## Manually requesting a review

Use a deep link to the App Store to allow the user to initiate an app review as a result of a button click. The deep link contains a query parameter **action=write-review**, embedded on the link.

```swift
static func requestReviewOnAppStore(){
    //Replace 'App Store ID' with an actually app store app ID
    guard let writeReviewUrl = URL(string: "https://apps.apple.com/app/id<#App ID#>?action=write-review") else {
            fatalError("Invalid App Store URL")
    }

    UIApplication.shared.open(witeReviewUrl, options: [:], completionHandler: nil)
}
```

- - -

# In-App Purchase

The in-app purchase API uses Swifft concurrency to provide simple in-app purchase workflows.

You can use this API to:

* **Load app store product information**
* **Display in-app purchase in your store**
* **Manage access to content and subscriptions**
* **Receive app store signed transaction information**

The in-app purchase API offers the following information:

* **Transaction information that's Apple signed in JWS (JSON Web Signature) format.**
* **Transactions and subscription status information that's simple to parse on the client.**
* **An *entitlements API* (current entitlements) that simplifies determining entitlements.**

To support a store in your app, implement the following functionality:

* Listen to transaction state changes while your app is running.
* Request the products to display on your app.
* Enable users to purchase your in-app products.
* Iterate through the user's in-app purchases and unlock purchased content and services.
* Validate signed transaction and signed subscription status information.

> To use in-app purchase you must first configure the purchase content in your app store connect.

# Product

> Information about a product configure in App Store Connect.

```swift
struct Product
```

Use **Product** to perform all product related tasks.

**Get a Product instance**

```swift
static func Product.products<Indentifiers>(for identifiers: Indentifiers) async throws -> [Product] where Identifiers : Collection, Identifiers.Element == String
```

**identifiers** - A collection of unique in-app purchase identifiers that are configured in app store connect. StoreKit will ignore duplicates.

```swift
let productIdentifiers: [String] = ["com.myapp.productA","com.myapp.productB"]
let myProducts: [Product] = try await Product.products(for: productIdentifiers)
```

**Intiate a purchase**

When user initiates a purchase call **Product.purchase(options:)**

```swift
func Product.purchase() async throws -> Product.PurchaseResult
```

# Transaction

> Information that represents the customers purchase of a product in your app. 

```swift
struct Transaction
```

A transaction represents a successful in-app purchase.

Use **Transaction** top perform the following transaction related tasks.

* Get user's transaction history, latest transaction and current entitlements to unlock content and services in your app.
* Access transaction properties
* Finish a transaction after the app delivers the purchased content or services.
* Access the JWS (JSON Web Signature) and supporting values to verify the transaction.
* Listen for new transactions while the app is running
* Beging a refund request within your app.












