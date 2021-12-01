# Gilded rose tech test

This is a well known kata developed by [Terry Hughes](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a `SellIn` value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s `SellIn` value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

# Raf's changes

1. First, i moved the 'gilded_rose.rb' file into the 'lib' folder, and the 'gilded_rose_spec.rb' file into the spec folder, so that the initial test could be read by rspec.
2. Next i wrote tests for each of the items/criteria listed in the brief, all in the spec file. 
3. Next i started refactoring the code. I chose to extract 'increasing and decreasing the quality' of the products into independent methods.
This meant that i could give the amount as an argument, meaning i was free to choose exactly how much the quality needed to change. 
4. I chose to use 'if' statements as it was the easiest way i could see to separate out the products to maximise readability. 
5. the 'increase_quality' and 'decrease_quality' methods grew more complicated the more changes i made. 

## Test Coverage

![Screenshot 2021-04-08 at 17 27 11](https://user-images.githubusercontent.com/76166627/114062721-bc30eb80-988f-11eb-9fd3-0e0e464558c1.png)

## How to run

Clone the repo

run ```bundle install```

Then run ```rspec``` to run the tests.
