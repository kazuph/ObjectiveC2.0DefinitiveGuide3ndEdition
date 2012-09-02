#import <Foundation/NSObject.h>
#import <stdio.h>

@interface Volume : NSObject
- (id) initWithMin: (int)a max:(int)b step:(int)s;
- (int)value;
- (int)up;
- (int)down;
@end

@implementation Volume {
    int val;
    int min, max, step;
}

- (id) initWithMin: (int)_min max:(int)_max step:(int)_step {
    self = [super init];
    if (self != nil) {
        val = min = _min;
        max = _max;
        step = _step;
    }
    return self;
}

- (int)value {
    return val;
}

- (int)up {
    if ((val += step) > max)
        val = max;
    return self;
}

- (int)down {
    if ((val -= step) < min)
        val = min;
    return self;
}
@end

int main(void) {
    /* printf("%d", (1000/3 * (3 + 999) + 1000/5 * (5 + 995) - 1000/15 * (15 + 990)) / 2); */
    printf("\n\n");
    id v,  w;
    v = [[Volume alloc] initWithMin:0 max:10 step:2];
    w = [[Volume alloc] initWithMin:0 max:9 step:3];
    [v up];
    printf("%d %d\n", [v value], [w value]);
    [v up];
    [w up];
    [v up];
    printf("%d %d\n", [v value], [w value]);
    [v down];
    [w down];
    printf("%d %d\n", [v value], [w value]);
    return 0;
}

