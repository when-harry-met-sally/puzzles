This is the first hard level puzzle I've attempted.

I'm passing quite a few test cases, but in the event of equal mass and overlaps, cases slip through.

I tried to implement a check for corners to detect collision, but I don't think this will work.

I think we need to check every path between the four points, and see if it intersects with any other paths.

So this would look probably like:

Where do they intersect, is that within the bounding box of either.

I will look up the equation for slope itnersection


```const rectangles = [[0, 0, 1, 1], [0, 1, 3, 2], [1, 0, 2, 2]];```

Is the issue, but I need to think about this, I don't even think intersection will help.

I think this highlights the fact that I need to take my time, and draw out these things rather than winging it.

The intersection approach doesn't really work.

Or maybe it does.

Maybe we find out the intersections of the slopes, and if more than two are greater than or equal to teh bounding box, we have a collision.

so, if the slope is:

y = 2
x = 2...


we just need to count if more than 2 cords are >= 

and we also, need to not do the 

nope. didn't work.

The 4 binding points are not enough.

Taking break.

--

Ok, what about the two slopes that cut a rectangle in two, if either intersect?
