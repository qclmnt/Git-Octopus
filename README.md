![Fizzer](Octopus.jpg)

# Git Octopus
> An open source app to track GitHub project's issues.

## Installation

You need to run

```
1. git clone https://github.com/fizzer/quentin-technical-test.git
2. pod install
```

and launch `Git Octopus.xcworkspace`

## Versions

### 1.0

- Connect with your Github Account
- Get your watched (= tracked) repositories
- Unwatched selected repository
- Search and watch new repository
- Search issues in watched respositories

### Next version 2.0 (to improve current app)

- Manage pagination (by creating RepositoryFeedSource and IssuesFeedSource)
- Database in order to access data offline
- Create Empty Screen for TableView in order to see a loader or an error message when loading fail

## Architecture

> Git Octopus used a pumped version of MVVM

### App Environment

The only singleton created by the app, it respect a protocol with properties that also respect protocol :

```
protocol Environment {
	var routing: QCNavigator? 
	var api: QCAPI?
	var session: GOSession?
}
```

it allow us to test easily the app with mock of principal services (navigation, networking etc...)
You just have to create an `extension` of the principal App Environment in the needed Target in order to configure the `environment`

#### How to: Add an other service

```
1. Create a new service protocol A
2. Add a nullable property respecting the protocol A in Environment protocol
3. Create an object that respect the protocol A
4. Configure the AppEnvironment with this object
``` 

### App Features

Every features are fragmented like that:

```
Feature:
__ UI
____ View
____ ViewController
____ ViewModel
__ Navigation
____ RoutingEntry
__ Network
____ APIEntry
```

#### UI

Every View or ViewController get a ViewModel
that allow us to test easily all the job logic in the ViewModel
and all the UI settings are in the View 

For a scrollView (TableView and CollectionView):
You need `sections` and `cellModels` 

Section : Get all the cellModels
CellModel : Get the cell logic and model to feed the cell

#### Navigation

In order to route somewhere in the app:

```
1. Create a new RoutingEntry (that respect the QCRoutingEntry protocol)
2. Use AppEnvironment singleton with routing property to route
Example: GOAppEnvironment.share().routing?.route(to: GOTestRouginEntry())
```

#### Network

In order to route somewhere call a web service:

```
1. Create a new APIEntry (respect the QCAPIEntry protocol)
2. Use AppEnvironment singleton with api property to do a request
Example: GOAppEnvironment.share().api?.request(with: GOAPITestEntry(), , success: {}, failure: {})
```

## Unit test

To run unit test :

`Cmd + U`

The target Git Octopus run every targets of test

Test only view model in order to test logic

To test the UI and viewController, you need UI Test

Every test should respect the following architecture :

```
// MARK: - methodName

func test_methodName_whatShouldAchieve_withConditions() {

	// Given
	Define the state before the test

	// When
	Behavior that you are testing

	// Then
	Changes that you expect due to the specified behavior
}
```


## Libraries

- Alamofire (Elegant HTTP Networking in Swift): to use easily URLSession and keep more readable networking
- KeychainAccess (Swift wrapper for Keychain): to secure the token storage

## GitHub Api

Documentation Reference
https://developer.github.com/v3
