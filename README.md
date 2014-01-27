transformingCarousel
====================

A tutorial on how to modify a iOS UICollectionView to look like a album art or your desired 3d transformation.



1. Create a fully setup UICollectionView with delegates. 

    You should be able to do this, if not then go back to the basics before continuing this tutorial.

2. Decide on the number of boxes you want to display. For this tutorial I am gonna use 4.

3. Add UIScrollViewDelegate because we're gonna use scrollViewDidScroll method .

4. Add your images to your project. If you are gonna use a image from web, you should definitely find a caching control for it. Because if you do not cache the images it would just load it again when you scroll into it and that takes a lot of memmory and process.

    This is my recommended control.

    https://github.com/rs/SDWebImage


5. Add a UIImageView to the UICollectionViewCell to contain our Image


6. Now here is the actual code that animate/transform the images in the cells.



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

We get the images that we want to transform by using 

    indexPath = [self.carouselCollectionView indexPathForItemAtPoint:CGPointMake(40.0f + (self.carouselCollectionView.contentOffset.x + (80* column)), 55.5f)];
              

40.0f,55.5 is the center of the cell. Basically we get the cell that is touching these coordinates. In my example project you will see a visual presentation of the points.

    finalTransform = [self tranformToBox:1 + column];
    
Now after getting the cell. We use CATransform3d to transform the image. Here is one of the sample transformation code that I used in the sample project, this is inside the tranformToBox method

  	CATransform3D tmp = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, 0.3326f, 0, 1, 0);
    tmp = CATransform3DIdentity;
    tmp.m34 = 0.0100f;
    transform = CATransform3DConcat(transform, tmp);
    transform = CATransform3DTranslate(transform, -5.6863f, -0.0000f, -0.0000f);
    transform = CATransform3DScale(transform, 1.0000f, 0.8725f, 1.0000f);
    transform = CATransform3DScale(transform, 1.0784f, 1.0000f, 1.0000f);

If you are not familiar with 3d transform here is a great tool to help you

https://github.com/erwinmaza/Transformifier

it gives you the Transform Codes

Now we apply it to the image using 

	imageView.layer.transform =finalTransform;


Thats it. Basically we are using CATransform3D to transform our image to our desired 3d Angle. I think this is the same
concept that is used for the album cover thingy in iOS I have a sample of it in this sample project.


