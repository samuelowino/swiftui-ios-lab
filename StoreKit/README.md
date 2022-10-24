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