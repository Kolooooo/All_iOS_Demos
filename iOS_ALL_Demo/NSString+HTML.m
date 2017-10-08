//
//  NSString+HTML.m
//  ShareJobStudent
//
//  Created by Sunnyyoung on 16/1/12.
//  Copyright © 2016年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import "NSString+HTML.h"

@implementation NSString (HTML)

- (NSString *)stringByDecodeHTMLEntities {
    NSString *decodedString = [NSString stringWithString:self];
    // Reserved Characters in HTML
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];

    // ISO 8859-1 Symbols
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&iexcl;" withString:@"¡"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&cent;" withString:@"¢"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&pound;" withString:@"£"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&curren;" withString:@"¤"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&yen;" withString:@"¥"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&brvbar;" withString:@"¦"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&sect;" withString:@"§"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&uml;" withString:@"¨"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&copy;" withString:@"©"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ordf;" withString:@"ª"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&laquo;" withString:@"«"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&not;" withString:@"¬"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&shy;" withString:@"    "];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&reg;" withString:@"®"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&macr;" withString:@"¯"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&deg;" withString:@"°"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&plusmn;" withString:@"±       "];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&sup2;" withString:@"²"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&sup3;" withString:@"³"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&acute;" withString:@"´"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&micro;" withString:@"µ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&para;" withString:@"¶"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&middot;" withString:@"·"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&cedil;" withString:@"¸"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&sup1;" withString:@"¹"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ordm;" withString:@"º"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&raquo;" withString:@"»"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&frac14;" withString:@"¼"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&frac12;" withString:@"½"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&frac34;" withString:@"¾"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&iquest;" withString:@"¿"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&times;" withString:@"×"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&divide;" withString:@"÷"];

    // ISO 8859-1 Characters
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Agrave;" withString:@"À"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Aacute;" withString:@"Á"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Acirc;" withString:@"Â"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Atilde;" withString:@"Ã"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Auml;" withString:@"Ä"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Aring;" withString:@"Å"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&AElig;" withString:@"Æ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ccedil;" withString:@"Ç"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Egrave;" withString:@"È"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Eacute;" withString:@"É"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ecirc;" withString:@"Ê"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Euml;" withString:@"Ë"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Igrave;" withString:@"Ì"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Iacute;" withString:@"Í"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Icirc;" withString:@"Î"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Iuml;" withString:@"Ï"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ETH;" withString:@"Ð"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ntilde;" withString:@"Ñ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ograve;" withString:@"Ò"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Oacute;" withString:@"Ó"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ocirc;" withString:@"Ô"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Otilde;" withString:@"Õ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ouml;" withString:@"Ö"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Oslash;" withString:@"Ø"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ugrave;" withString:@"Ù"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Uacute;" withString:@"Ú"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Ucirc;" withString:@"Û"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Uuml;" withString:@"Ü"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&Yacute;" withString:@"Ý"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&THORN;" withString:@"Þ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&szlig;" withString:@"ß"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&agrave;" withString:@"à"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&aacute;" withString:@"á"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&acirc;" withString:@"â"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&atilde;" withString:@"ã"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&auml;" withString:@"ä"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&aring;" withString:@"å"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&aelig;" withString:@"æ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ccedil;" withString:@"ç"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&egrave;" withString:@"è"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ecirc;" withString:@"ê"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&euml;" withString:@"ë"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&igrave;" withString:@"ì"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&iacute;" withString:@"í"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&icirc;" withString:@"î"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&iuml;" withString:@"ï"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&eth;" withString:@"ð"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ntilde;" withString:@"ñ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ograve;" withString:@"ò"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&oacute;" withString:@"ó"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ocirc;" withString:@"ô"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&otilde;" withString:@"õ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ouml;" withString:@"ö"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&oslash;" withString:@"ø"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ugrave;" withString:@"ù"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&uacute;" withString:@"ú"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&ucirc;" withString:@"û"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&uuml;" withString:@"ü"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&yacute;" withString:@"ý"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&thorn;" withString:@"þ"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"&yuml;" withString:@"ÿ"];

    return decodedString;
}

- (NSString *)stringByStripHTMLTags {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:data options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)} documentAttributes:nil error:nil];
    return attributedString.string;
}

@end
