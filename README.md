# MonzoClone
This is a personal project to replicate the Monzo app and create new spending analysis, using Swift. 

## What have I built?
So far, I have built the Home screen (as it previously looked) and the transaction information screen. 

## How have I built it?

The Home screen is a UIViewController with a UIView and a UICollectionView as subviews. And the Transaction screen is a UICollectionView. I have signed into my own Monzo developer account and pulled some transactions as a JSON. I have redacted the JSON to remove sensitive information and added it as a local file within the project. I've then cast that file as a JSON so I can use it in the project. This data is for demonstration purposes, at this point. Once the project is completely set up, I will change the methods getMonzoTransactions() and getMonzoBalance() so that anyone can do an API call directly to their Monzo acccount using OAuth 2.0.

## Why have I built it?

Currently in the Monzo app, I can view transactions either by category since last paycheque, or see the total amount I've spent at that merchant since joining Monzo. However, I can't see the total amount spent at each merchant since my last paycheque. Nor can I see the amount spent in more niche categories, e.g. coffee or beer, since my last paycheque. This is what I intend to build!

## What is next to build?

The overall aim is to create new ways of visualising my spending.

- [ ] Change HomeViewController to subclass UICollectionView, rather than UIViewController. Simply make the UIView at the top of the screen into a header at section == 0. Create a custom UICollectionViewFlowLayout component to fix the header at the top and make every subsequent header be sticky to the bottom of that top header

- [ ] In TransactionViewController, when collectionView.contentOffset.y reaches a certain value (when pulling content down), pop to a new ViewController that displays a full screen map of transaction location 

- [ ] If only one transaction at a particular merchant, don't show history cells or header

- [ ] Enable query of all transactions at a specific merchant

- [ ] Enable user to change category and add/edit notes

- [ ] For TfL transactions, remove map showing location

- [x] Create the 'Summary' screen that places transactions into categories

- [ ] Create a new screen that displays amount spent per merchant since payday...this is where the real fun begins!

