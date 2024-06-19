package backend.encoding;

using StringTools;
abstract UrlEncodedString(String) from String to String {
    public function new(str:String) {
        var chars:Array<String> = [];
        for (char in str.split('')) {
            if (ParentEncoding.RESERVED_CHARACTERS.exists(char)) chars.push( ParentEncoding.RESERVED_CHARACTERS.get(char));
            else chars.push(char);
        }

        this = chars.join("");
    }
}

class ParentEncoding {
    public static final RESERVED_CHARACTERS = [
        " " => "%20",
        "!" => "%21",
        "\"" => "%22",
        "#" => "%23",
        "$" => "%24",
        "%" => "%25",
        "&" => "%26",
        "'" => "%27",
        "(" => "%28",
        ")" => "%29",
        "*" => "%2A",
        "+" => "%2B",
        "," => "%2C",
        "/" => "%2F",
        ":" => "%3A",
        ";" => "%3B",
        "=" => "%3D",
        "?" => "%3F",
        "@" => "%40",
        "[" => "%5B",
        "]" => "%5D"
    ];
}