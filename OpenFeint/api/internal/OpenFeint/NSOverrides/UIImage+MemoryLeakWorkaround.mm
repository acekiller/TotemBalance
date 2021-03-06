////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// 
///  Copyright 2010 Aurora Feint, Inc.
/// 
///  Licensed under the Apache License, Version 2.0 (the "License");
///  you may not use this file except in compliance with the License.
///  You may obtain a copy of the License at
///  
///  	http://www.apache.org/licenses/LICENSE-2.0
///  	
///  Unless required by applicable law or agreed to in writing, software
///  distributed under the License is distributed on an "AS IS" BASIS,
///  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///  See the License for the specific language governing permissions and
///  limitations under the License.
/// 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#import "UIImage+MemoryLeakWorkaround.h"



@implementation UIImage(MemoryLeakWorkaround)

- (void)drawAsPatternInRectNoMemLeak:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSaveGState(context);
	CGContextSetBlendMode(context, kCGBlendModeNormal);
	
	CGImageRef cgImage = self.CGImage;
	
	CGRect image_rect = CGRectMake(0.f, 0.f, self.size.width, self.size.height);
	
	CGContextTranslateCTM(context, 0, self.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGContextDrawTiledImage(context, image_rect, cgImage);
	
	CGContextRestoreGState(context);
}

@end

