//
//  ViewController.m
//  transformingCarousel
//
//  Created by Andrew Ramirez on 1/27/14.
//  Copyright (c) 2014 Andrew Ramirez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *images;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    images= [[NSMutableArray alloc] initWithObjects:@"image1",@"image2",@"image3",@"image4",@"image5",@"image1",@"image2",@"image3",@"image4",@"image5", nil];
    
    [self.carouselAlbumCoverCollectionView setBackgroundColor:[UIColor grayColor]];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];


    
    for (int x=0; x<4; x++) {
    
//    DONT MIND THIS CODE THIS IS JUST A MARKER FOR YOU TO VISUALIZE THE POINT WHERE THE CODE WILL LOOK FOR A VIEW TO TRANSFORM

        //  40,55.5 is the center of the cell
        //  80 width of the cell
        
        UIView *marker = [[UIView alloc] initWithFrame:CGRectMake(40.0f + (x * 80.0f), 55.5f, 10, 10)];
        [marker setBackgroundColor:[UIColor redColor]];
        [marker setTag:200 + x +1];
        [self.carouselCollectionView addSubview:marker];

        
//    END MARKER
        
        [self transformThisCellAtColumn:x];
        [self transformAlbumAtColumn:x];
    }
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  [images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
 
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_VIEW];
    
    [imageView setImage:[UIImage imageNamed:images[indexPath.row]]];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    for (int x=0; x<4; x++) {
        [self transformThisCellAtColumn:x];
        [self transformAlbumAtColumn:x];
    }
}


-(void)transformThisCellAtColumn:(int)column{
//  MARKER OPTIONS
    UIView *marker=[self.carouselCollectionView viewWithTag:200 + column + 1];
    marker.center =CGPointMake(40.0f + (self.carouselCollectionView.contentOffset.x + (80* column)), 55.5f);
//
    
    NSIndexPath *indexPath;
    CATransform3D finalTransform;
    indexPath = [self.carouselCollectionView indexPathForItemAtPoint:CGPointMake(40.0f + (self.carouselCollectionView.contentOffset.x + (80* column)), 55.5f)];
    finalTransform = [self tranformToBox:1 + column];
    UICollectionViewCell *cell = [self.carouselCollectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_VIEW];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear)
                     animations:^ {
                         imageView.layer.transform =finalTransform;
                     }
                     completion:NULL
     ];
    
}

- (CATransform3D)tranformToBox:(int)boxNumber{
    CATransform3D transform = CATransform3DIdentity;
    if (boxNumber == 2) {
        /*
         Transform description:
         Rotate around Y by 19.06 degrees
         Apply 1.00 percent of perspective
         Translate along X by -5.69 points
         Scale Y by 87.25 percent
         Scale X by 107.84 percent
         */
        
        CATransform3D tmp = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, 0.3326f, 0, 1, 0);
        tmp = CATransform3DIdentity;
        tmp.m34 = 0.0100f;
        transform = CATransform3DConcat(transform, tmp);
        transform = CATransform3DTranslate(transform, -5.6863f, -0.0000f, -0.0000f);
        transform = CATransform3DScale(transform, 1.0000f, 0.8725f, 1.0000f);
        transform = CATransform3DScale(transform, 1.0784f, 1.0000f, 1.0000f);
    }else if (boxNumber == 3){
        /*
         Transform description:
         Rotate around Y by -19.76 degrees
         Apply 1.00 percent of perspective
         Translate along X by 5.88 points
         Scale Y by 87.25 percent
         Scale X by 107.84 percent
         */
        CATransform3D tmp = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, -0.3450f, 0, 1, 0);
        tmp = CATransform3DIdentity;
        tmp.m34 = 0.0100f;
        transform = CATransform3DConcat(transform, tmp);
        transform = CATransform3DTranslate(transform, 5.8824f, 0.0000f, 0.0000f);
        transform = CATransform3DScale(transform, 1.0000f, 0.8725f, 1.0000f);
        transform = CATransform3DScale(transform, 1.0884f, 1.0000f, 1.0000f);
    }else if (boxNumber == 4){
        /*
         Transform description:
         Rotate around Y by -19.76 degrees
         Apply 1.00 percent of perspective
         Translate along X by 5.88 points
         Scale Y by 69.61 percent
         Scale X by 107.84 percent
         */
        CATransform3D tmp = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, -0.3450f, 0, 1, 0);
        tmp = CATransform3DIdentity;
        tmp.m34 = 0.0100f;
        transform = CATransform3DConcat(transform, tmp);
        transform = CATransform3DTranslate(transform, 5.8824f, 0.0000f, 0.0000f);
        transform = CATransform3DScale(transform, 1.0000f, 0.6461f, 1.0000f);
        transform = CATransform3DScale(transform, 1.0784f, 1.0000f, 1.0000f);
    }else if (boxNumber == 1){
        /*
         Transform description:
         Rotate around Y by 19.06 degrees
         Apply 1.00 percent of perspective
         Translate along X by -5.69 points
         Scale Y by 69.61 percent
         Scale X by 107.84 percent
         */
 
        CATransform3D tmp = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, 0.3326f, 0, 1, 0);
        tmp = CATransform3DIdentity;
        tmp.m34 = 0.0100f;
        transform = CATransform3DConcat(transform, tmp);
        transform = CATransform3DTranslate(transform, -5.6863f, -0.0000f, -0.0000f);
        transform = CATransform3DScale(transform, 1.0000f, 0.6561f, 1.0000f);
        transform = CATransform3DScale(transform, 1.0684f, 1.0000f, 1.0000f);
    }
    
    return transform;
}

-(void)transformAlbumAtColumn:(int)column{
    NSIndexPath *indexPath;
    CATransform3D finalTransform;
    indexPath = [self.carouselAlbumCoverCollectionView indexPathForItemAtPoint:CGPointMake(40.0f + (self.carouselAlbumCoverCollectionView.contentOffset.x + (80* column)), 55.5f)];
    finalTransform = [self albumCover:1 + column];
    UICollectionViewCell *cell = [self.carouselAlbumCoverCollectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_VIEW];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear)
                     animations:^ {
                         imageView.layer.transform =finalTransform;
                     }
                     completion:NULL
     ];
    
}



- (CATransform3D)albumCover:(int)boxNumber{
    CATransform3D transform = CATransform3DIdentity;
    
    if (boxNumber == 2) {
        /*
         Transform description:
         Rotate around X by 0.00 degrees
         Translate along X by 0.00 points
         Apply 0.00 percent of perspective
         Scale X by 100.00 percent
         */
        CATransform3D tmp = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, 0.0000f, 1, 0, 0);
        transform = CATransform3DTranslate(transform, 0.0000f, 0.0000f, 0.0000f);
        tmp = CATransform3DIdentity;
        tmp.m34 = 0.0000f;
        transform = CATransform3DConcat(transform, tmp);
        transform = CATransform3DScale(transform, 1.0000f, 1.0000f, 1.0000f);

    }else if (boxNumber == 1 || boxNumber == 3){
        /*
         Transform description:
         Rotate around Y by 75.53 degrees
         Apply -0.31 percent of perspective
         Translate along X by 0.00 points
         Scale X by 100.00 percent
         */
        CATransform3D tmp = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, 1.3182f, 0, 1, 0);
        tmp = CATransform3DIdentity;
        tmp.m34 = -0.0031f;
        transform = CATransform3DConcat(transform, tmp);
        transform = CATransform3DTranslate(transform, 0.0000f, 0.0000f, 0.0000f);
        transform = CATransform3DScale(transform, 1.0000f, 1.0000f, 1.0000f);

    }
    
    return transform;
}











@end
