//
//  Playlist.m
//  AlgoRhythm
//
//  Created by Jacqueline Ali on 12/28/15.
//  Copyright © 2015 Jacqueline Ali Cordoba. All rights reserved.
//

#import "Playlist.h"
#import "MusicLibrary.h"


@implementation Playlist

- (instancetype)initWithIndex:(NSUInteger)index;
{
    self = [super init];
    if (self) {
        MusicLibrary *musicLibrary = [[MusicLibrary alloc] init];
        NSArray *library = musicLibrary.library;
        NSDictionary *playlistDictionary = [library objectAtIndex:index];
        
        _playlistTitle = [playlistDictionary objectForKey:kTitle];
        _playlistDescription = [playlistDictionary objectForKey:kDescription];
        
        NSString *iconName = [playlistDictionary objectForKey:kIcon];
        _playlistIcon = [UIImage imageNamed:iconName];
        
        NSString *largeIconName = [playlistDictionary objectForKey:kLargeIcon];
        _playlistIconLarge = [UIImage imageNamed:largeIconName];
        
        _artists = [NSArray arrayWithArray:[playlistDictionary objectForKey:kArtists]];
        
        NSDictionary *colorDictionary = [playlistDictionary objectForKeyedSubscript:kBackgroundColor];
        _backgroundColor = [self rgbColorFromDictionary:colorDictionary];
        
    }
    return self;
}

-(UIColor *)rgbColorFromDictionary:(NSDictionary *)colorDictionary; {
    CGFloat red = [[colorDictionary objectForKey:@"red"] doubleValue];
    CGFloat blue = [[colorDictionary objectForKey:@"green"] doubleValue];
    CGFloat green = [[colorDictionary objectForKey:@"blue"] doubleValue];
    CGFloat alpha = [[colorDictionary objectForKey:@"alpha"] doubleValue];
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
                     

}


@end