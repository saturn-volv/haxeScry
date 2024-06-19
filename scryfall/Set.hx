package scryfall;

class Set {
    private final _struct:SetObject;
    public function new(obj:SetObject) {
        this._struct = obj;
    }
}
typedef SetObject = {
    var id:String;
    var code:String;
    var ?mtgo_code:String;
    var ?arena_code:String;
    var ?tcgplayer_id:Int;
    var name:String;
    var set_type:String;
    var ?released_at:String;
    var ?block_code:String;
    var ?block:String;
    var ?parent_set_code:String;
    var card_count:Int;
    var ?printed_size:Int;
    var digital:Bool;
    var foil_only:Bool;
    var nonfoil_only:Bool;
    var scryfall_uri:String;
    var icon_svg_uri:String;
    var search_uri:String;
}

enum abstract SetType(String) from String to String {
    var CORE = 'core';
    var EXPANSION = 'expansion';
    var MASTERS = 'masters';
    var ALCHEMY = 'alchemy';
    var MASTERPIECE = 'masterpiece';
    var ARSENAL = 'arsenal';
    var FROM_THE_VAULT = 'from_the_vault';
    var SPELLBOOK = 'spellbook';
    var PREMIUM_DECK = 'premium_deck';
    var DUEL_DECKS = 'duel_decks';
    var DRAFT_INNOVATION = 'draft_innovation';
    var TREASURE_CHEST = 'treasure_chest';
    var COMMANDER = 'commander';
    var PLANECHASE = 'planechase';
    var ARCHENEMY = 'archenemy';
    var VANGUARD = 'vanguard';
    var FUNNY = 'funny';
    var STARTER = 'starter';
    var BOX = 'box';
    var PROMO = 'promo';
    var TOKEN = 'token';
    var MEMORABILIA = 'memorabilia';
    var MINIGAME = 'minigame';
}