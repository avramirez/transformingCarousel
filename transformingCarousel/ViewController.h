//
//  ViewController.h
//  transformingCarousel
//
//  Created by Andrew Ramirez on 1/27/14.
//  Copyright (c) 2014 Andrew Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IMAGE_CONTAINER 100
#define IMAGE_VIEW 101

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *carouselCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *carouselAlbumCoverCollectionView;

@end
