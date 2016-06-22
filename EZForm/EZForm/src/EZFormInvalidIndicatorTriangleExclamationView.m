//
//  EZForm
//
//  Copyright 2011-2013 Chris Miles. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EZFormInvalidIndicatorTriangleExclamationView.h"
#import <tgmath.h>

@implementation EZFormInvalidIndicatorTriangleExclamationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
	self.opaque = NO;
	self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    #pragma unused(rect)
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGRect bounds = self.bounds;
    
    /* Draw triangle
     */
    CGFloat padding = floor(CGRectGetWidth(bounds) * (CGFLOAT_TYPE)0.05);
    CGFloat lineWidth = floor(CGRectGetWidth(bounds) * (CGFLOAT_TYPE)0.075);
    
    CGContextMoveToPoint(c, CGRectGetMinX(bounds) + padding, CGRectGetMaxY(bounds) - padding);
    CGContextAddLineToPoint(c, floor(CGRectGetMidX(bounds)), CGRectGetMinY(bounds) + padding);
    CGContextAddLineToPoint(c, CGRectGetMaxX(bounds) - padding, CGRectGetMaxY(bounds) - padding);
    CGContextClosePath(c);
    
    CGContextSetLineWidth(c, lineWidth);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    CGContextSetStrokeColorWithColor(c, [UIColor redColor].CGColor);
    CGContextStrokePath(c);
    
    /* Draw exclamation point
     */
    CGFloat canvasWidth = bounds.size.width;
    CGFloat canvasHeight = bounds.size.height;
    CGFloat bangTopWidth = canvasWidth*(CGFLOAT_TYPE)0.15;
    CGFloat bangBotWidth = canvasWidth*(CGFLOAT_TYPE)0.08;
    
    // Draw top
    CGContextMoveToPoint(c, canvasWidth/(CGFLOAT_TYPE)2.0 - bangTopWidth/(CGFLOAT_TYPE)2.0, canvasHeight*(CGFLOAT_TYPE)0.3);
    CGContextAddQuadCurveToPoint(c, canvasWidth/(CGFLOAT_TYPE)2.0, canvasHeight*(CGFLOAT_TYPE)0.2,  canvasWidth/(CGFLOAT_TYPE)2.0 + bangTopWidth/(CGFLOAT_TYPE)2.0, canvasHeight*(CGFLOAT_TYPE)0.3);
    CGContextAddLineToPoint(c, canvasWidth/(CGFLOAT_TYPE)2.0 + bangBotWidth/(CGFLOAT_TYPE)2.0, canvasHeight*(CGFLOAT_TYPE)0.65);
    CGContextAddQuadCurveToPoint(c, canvasWidth/(CGFLOAT_TYPE)2.0, canvasHeight*(CGFLOAT_TYPE)0.7, canvasWidth/(CGFLOAT_TYPE)2.0 - bangBotWidth/(CGFLOAT_TYPE)2.0, canvasHeight*(CGFLOAT_TYPE)0.65);
    CGContextClosePath(c);
    CGContextSetFillColorWithColor(c, [UIColor blackColor].CGColor);
    CGContextFillPath(c);

    // Draw dot
    CGFloat radius = bangBotWidth;
    CGFloat centerX = canvasWidth/(CGFLOAT_TYPE)2;
    CGFloat centerY = canvasHeight*(CGFLOAT_TYPE)0.8;
    CGContextAddEllipseInRect(c, CGRectMake(centerX - radius, centerY - radius, radius*2, radius*2));
    CGContextSetFillColorWithColor(c, [UIColor blackColor].CGColor);
    CGContextFillPath(c);
}

@end
