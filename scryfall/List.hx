package scryfall;

typedef ListObject = {
    var data:Array<Dynamic>;
    var has_more:Bool;
    var ?next_page:String;
    var ?total_cards:Int;
    var ?warnings:Array<Dynamic>;
}