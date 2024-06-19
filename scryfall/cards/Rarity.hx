package scryfall.cards;

enum abstract Rarity(String) from String to String {
    var COMMON = 'common';
    var UNCOMMON = 'uncommon';
    var RARE = 'rare';
    var MYTHIC = 'mythic';
}