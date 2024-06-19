package scryfall.cards;

import scryfall.Card.CardImageObject;
import backend.encoding.UrlEncodedString;
import haxe.Http;

enum abstract UniqueMode(String) to String {
    var CARDS = 'cards';
    var ART = 'art';
    var PRINTS = 'prints';
}
enum abstract SortMode(String) to String {
    var NAME = 'name';
    var SET = 'set';
    var RELEASED = 'released';
    var RARITY = 'rarity';
    var COLOR = 'color';
    var USD = 'usd';
    var TIX = 'tix';
    var EUR = 'eur';
    var CMC = 'cmc';
    var POWER = 'power';
    var TOUGHNESS = 'toughness';
    var EDHREC = 'edhrec';
    var PENNY = 'penny';
    var ARTIST = 'artist';
    var REVIEW = 'review';
}
enum abstract SortDirection(String) to String {
    var AUTO = 'auto';
    var ASC = 'asc';
    var DESC = 'desc';
}
typedef CardSearchParams = {
    var ?unique:UniqueMode;
    var ?order:SortMode;
    var ?dir:SortDirection;
    var ?include_extras:Bool;
    var ?include_multilingual:Bool;
    var ?include_variations:Bool;
    var ?page:Int;
}
typedef NameCardSearchParams = {
    var ?set:String;
    var ?backface:Bool;
    var ?version:CardImageObject;
}

class CardSearch {}