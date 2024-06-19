package scryfall.cards;

enum abstract Legality(String) from String to String {
    var NOT_LEGAL = 'not_legal';
    var LEGAL = 'legal';
    var RESTRICTED = 'restricted';
    var BANNED = 'banned';
}

typedef LegalitiesObject = {
    var standard:Legality;
    var future:Legality;
    var historic:Legality;
    var timeless:Legality;
    var gladiator:Legality;
    var pioneer:Legality;
    var explorer:Legality;
    var modern:Legality;
    var legacy:Legality;
    var pauper:Legality;
    var vintage:Legality;
    var penny:Legality;
    var commander:Legality;
    var oathbreaker:Legality;
    var standard_brawl:Legality;
    var brawl:Legality;
    var alchemy:Legality;
    var paupercommander:Legality;
    var duel:Legality;
    var oldschool:Legality;
    var premoder:Legality;
    var predh:Legality;
}