package scryfall;

import scryfall.cards.Rarity;
import scryfall.cards.Legalities.LegalitiesObject;

class Card {
    private final _struct:CardObject;
    public function new(obj:CardObject) {
        this._struct = obj;
    }

    public function toString():String {
        return '\n${this._struct.name} ${this._struct.mana_cost ?? ''}\n${_struct.type_line}\n${_struct.oracle_text}\n';
    }
}

typedef CardObject = {
    var id:String;
    var oracle_id:String;
    var multiverse_ids:Array<Int>;
    var mtgo_id:Int;
    var arena_id:Int;
    var tcgplayer_id:Int;
    var cardmarket_id:Int;

    var name:String;
    var lang:String;
    var released_at:String;
    var uri:String;
    var scryfall_uri:String;
    var layout:String;
    var highres_image:Bool;
    var image_status:String;
    var ?image_uris:Array<CardImageObject>;
    var ?mana_cost:String;
    var cmc:Int;
    var type_line:String;
    var ?oracle_text:String;
    var ?colors:Array<String>;
    var color_identity:Array<String>;
    var keywords:Array<String>;
    var card_faces:Array<CardFaceObject>;
    var all_parts:Array<RelatedCardObject>;
    var legalities:LegalitiesObject;
    var games:Array<String>;
    var reserved:Bool;
    var foil:Bool;
    var nonfoil:Bool;
    var finishes:Array<String>;
    var oversized:Bool;
    var promo:Bool;
    var reprint:Bool;
    var variation:Bool;

    var set_id:String;
    var set:String;
    var set_name:String;
    var set_type:String;
    var set_uri:String;
    var set_search_uri:String;
    var scryfall_set_uri:String;
    var rulings_uri:String;
    var prints_search_uri:String;
    var collector_number:String;
    var digital:Bool;
    var rarity:Rarity;
    var artist:String;
    var artist_ids:Array<String>;
    var border_color:String;
    var frame:String;
    var frame_effects:Array<String>;
    var security_stamp:String;
    var full_art:Bool;
    var textless:Bool;
    var booster:Bool;
    var story_spotlight:Bool;
    var edhrec_rank:Int;

    var prices:Dynamic;
    var related_uris:Dynamic;
    var purchase_uris:Dynamic;
}

typedef CardFaceObject = {
    var name:String;
    var mana_cost:String;
    var type_line:String;
    var oracle_text:String;
    var colors:Array<String>;
    var power:String;
    var toughness:String;
    var flavor_text:String;
    var artist:String;
    var artist_id:String;
    var illustration_id:String;
    var image_uris:CardImageObject;
}

typedef CardImageObject = {
    var small:String;
    var normal:String;
    var large:String;
    var png:String;
    var art_crop:String;
    var border_crop:String;
}

typedef RelatedCardObject = {
    var id:String;
    var component:String;
    var name:String;
    var type_line:String;
    var uri:String;
}