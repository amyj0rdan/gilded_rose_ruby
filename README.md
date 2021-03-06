# Gilded Rose Refactoring Challenge

See [here](https://github.com/makersacademy/course/blob/master/individual_challenges/gilded_rose.md) for the original Makers repo.     
See [here](https://github.com/emilybache/GildedRose-Refactoring-Kata) for Emily Bache's repo of legacy code.

[The kata](#the-kata) | [The brief](#the-brief) | [Approach](#approach)     
[Getting started](#getting-started) | [Running tests](#running-tests) | [Usage](#usage) | [Screenshot](#screenshot)

## The kata

"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

## The brief

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

HINT: Test first FTW!

## Approach

1. Spend time understanding the kata, as if writing from scratch
2. Tidy folder structure to be as per usual Ruby project
3. Write tests for all current functionality
4. Extract out methods that are repeated by item types
5. Run tests every time a change is made
6. Quick wins (eg, change `item.quality = item.quality + 1` to `item.quality += 1`)
7. Use a linter and follow recommendations
8. Remove unnecessary if statements where these are duplicated in the code
9. Change negative if statements to positive unless statements
10. Reuse methods where possible
11. Extract out classes for each item that inherits from the Item class. (Therefore the Item class is left untampered with and new items with new update requirements can be easily added.)
12. Add feature test that replicates the behaviour in the original texttest_fixture.rb (I should have done this earlier and would have had more security in my code throughout if I had)

## Getting started

First clone this repo, then:
```bash
> bundle install
```
## Running tests

```bash
> bundle exec rspec # Run the tests to ensure it works
```

## Usage

```bash
> irb
> require './lib/gilded_rose.rb' # Create items and the Gilded Rose in the command line
```

## Screenshot

<img width="1143" alt="Screenshot 2019-05-10 at 20 12 38" src="https://user-images.githubusercontent.com/45539085/57551133-384aed80-7360-11e9-99a7-a62b2cbc60d9.png">
