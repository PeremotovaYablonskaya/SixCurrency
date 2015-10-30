//
//  PYDataStore.m
//  SixthCourses
//
//  Created by fpmi on 24.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import "PYDataStore.h"

@implementation PYDataStore
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error %@", error);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //парсим
    NSXMLParser *rssParser = [[NSXMLParser alloc] initWithData:self.receivedData];
    rssParser.delegate = self;
    [rssParser parse];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.receivedData = [[NSMutableData alloc] init];
    
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    self.currentElement = elementName;
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([self.currentElement isEqualToString:@"Name"]) {
        if(![trimmedString isEqualToString:@""])
         self.currency = [NSString stringWithFormat:@"%@" ,string];
    } else if ([self.currentElement isEqualToString:@"Rate"]) {
        if(![trimmedString isEqualToString:@""]){
        self.currency= [NSString stringWithFormat:@"%@: %@", self.currency,string];
            NSLog(self.currency);}
    }
}

/*2015-10-30 14:28:02.618 fgcdfgd[990:24170] Австралийский доллар: 12372.92
2015-10-30 14:28:02.618 fgcdfgd[990:24170] Болгарский лев: 9811.09
2015-10-30 14:28:02.618 fgcdfgd[990:24170] Гривна: 761.09
2015-10-30 14:28:02.619 fgcdfgd[990:24170] Датская крона: 2565.38
2015-10-30 14:28:02.619 fgcdfgd[990:24170] Доллар США: 17450
2015-10-30 14:28:02.619 fgcdfgd[990:24170] Евро: 19077
2015-10-30 14:28:02.619 fgcdfgd[990:24170] Злотый: 4474.36
2015-10-30 14:28:02.620 fgcdfgd[990:24170] Иранский риал: 582.52
2015-10-30 14:28:02.620 fgcdfgd[990:24170] Исландская крона: 134.95
2015-10-30 14:28:02.620 fgcdfgd[990:24170] Йена: 1445.55
2015-10-30 14:28:02.620 fgcdfgd[990:24170] Канадский доллар: 13202.19
2015-10-30 14:28:02.620 fgcdfgd[990:24170] Китайский юань: 2745.16
2015-10-30 14:28:02.621 fgcdfgd[990:24170] Кувейтский динар: 57569.86
2015-10-30 14:28:02.621 fgcdfgd[990:24170] Молдавский лей: 867.08
2015-10-30 14:28:02.621 fgcdfgd[990:24170] Новозеландский доллар: 11647
2015-10-30 14:28:02.621 fgcdfgd[990:24170] Норвежская крона: 2037.41
2015-10-30 14:28:02.622 fgcdfgd[990:24170] Российский рубль: 271.76
2015-10-30 14:28:02.637 fgcdfgd[990:24170] СДР (Специальные права заимствования): 24402.78
2015-10-30 14:28:02.637 fgcdfgd[990:24170] Сингапурcкий доллар: 12444.29
2015-10-30 14:28:02.637 fgcdfgd[990:24170] Сом: 252.62
2015-10-30 14:28:02.637 fgcdfgd[990:24170] Тенге: 62.53
2015-10-30 14:28:02.637 fgcdfgd[990:24170] Турецкая лира: 5971.43
2015-10-30 14:28:02.638 fgcdfgd[990:24170] Фунт стерлингов: 26631.32
2015-10-30 14:28:02.638 fgcdfgd[990:24170] Чешская крона: 705.96
2015-10-30 14:28:02.638 fgcdfgd[990:24170] Шведская крона: 2050.5
2015-10-30 14:28:02.638 fgcdfgd[990:24170] Швейцарский франк: 17623.59*/

@end
