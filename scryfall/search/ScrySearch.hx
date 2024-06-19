package scryfall.search;

import scryfall.cards.CardSearch.NameCardSearchParams;
import scryfall.Set.SetObject;
import scryfall.cards.CardSearch.CardSearchParams;
import backend.encoding.UrlEncodedString;

using StringTools;

class ScrySearch {
    /**
     * Searches the Scryfall database for the set object of matching code `code`.
     * @param code The Unique three to five-letter code for the requested set.
     */
    public static function searchSet(code:String):Set {
        var urlBuild:String = 'https://api.scryfall.com/sets/$code';
        var data = requestFromURL(urlBuild);
        var setObject:SetObject = haxe.Json.parse(data);
        return new Set(setObject);
    }
    public static function getSets():Array<Set> {
        var urlBuild:String = 'https://api.scryfall.com/sets';
        var data = requestFromURL(urlBuild);
        var setArray = [];
        for (setObj in cast(haxe.Json.parse(data).data, Array<Dynamic>)) {
            setArray.push(new Set(setObj));
        }

        return setArray;
    }
    public static function fuzzySearchCard(search:UrlEncodedString, ?params:NameCardSearchParams):Null<Card> {
        var urlBuild:String = 'https://api.scryfall.com/cards/named?fuzzy=$search';
        return searchCard(urlBuild, params);
    }
    public static function exactSearchCard(search:UrlEncodedString, ?params:NameCardSearchParams):Null<Card> {
        var urlBuild:String = 'https://api.scryfall.com/cards/named?exact=$search';
        return searchCard(urlBuild, params);
    }

    private static function searchCard(url:String, ?params:NameCardSearchParams):Null<Card> {
        var urlBuild = url;
        if (params != null) {
            if (params.set != null) urlBuild += '&set=${params.set}';
            if (params.backface != null) urlBuild += params.backface ? '&face=back' : '';
            if (params.version != null) urlBuild += '&version=${params.version}';
        }
        return getCardFromURL(urlBuild);
    }
    public static function randomCard(query:UrlEncodedString) {
        var urlBuild:String = 'https://api.scryfall.com/cards/random?q=$query';
        return getCardFromURL(urlBuild);
    }
    public static function queryCard(query:UrlEncodedString, ?params:CardSearchParams):Null<Array<Card>> {
        var urlBuild:String = 'https://api.scryfall.com/cards/search?q=$query';
        if (params != null) {
            if (params.unique != null) urlBuild += '&unique=${params.unique}';
            if (params.order != null) urlBuild += '&order=${params.order}';
            if (params.dir != null) urlBuild += '&dir=${params.dir}';
            if (params.include_extras != null) urlBuild += '&include_extras=${params.include_extras}';
            if (params.include_multilingual != null) urlBuild += '&include_multilingual=${params.include_multilingual}';
            if (params.include_variations != null) urlBuild += '&include_variations=${params.include_variations}';
            if (params.page != null) urlBuild += '&page=${params.page}';
        }
        return getCardListFromURL(urlBuild);
    }

    private static function getCardFromURL(url:String):Null<Card> {
        var data = requestFromURL(url);
        var jsonData = haxe.Json.parse(data);
        return new Card(jsonData);
    }
    private static function getCardListFromURL(url:String):Null<Array<Card>> {
        var cardArray:Null<Array<Card>> = null;
        var data = requestFromURL(url);
        var jsonData = haxe.Json.parse(data);
        for (card in cast(jsonData.data, Array<Dynamic>)) {
            if (cardArray == null) cardArray = [];

            var successfulCard = new Card(card);
            cardArray.push(successfulCard);
        }
        return cardArray;
    }
    
    private static function requestFromURL( url : String ) : String {
        #if js
        var req = js.Browser.createXMLHttpRequest();
        req.open("GET", url, false);
        req.send();
        return req.responseText;
        #else
        return haxe.Http.requestUrl(url);
        #end
    }
}