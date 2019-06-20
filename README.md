# CenCheckbox

This is a modified version of BEMCheckBox for MacOS, since BEMCheckBox is designed for iOS platform only. For the current version, 4 animations are integrated, you can try to add more, I will improve this version when I am free. Hope this repository helps someone who wanted to use BEM-style checkbox on MacOS.<br /><br />

<p align="center"> 
<img src="https://github.com/ZHANGneuro/CenCheckbox/blob/master/Screenshot.png">
</p>


## Setup
1. Import ```"CenCheckBox.h"```
```Objective C
#import "CenCheckBox.h"
```

2. Initializing "CenCheckBox" and add it to a NSView. 
```Objective C
CenCheckBox *checkbox = [[CenCheckBox alloc] initWithFrame:NSMakeRect(0, 0, 200, 200)];
[window.contentView addSubview:checkbox];
```

3. Setting animation after initializing.
```Objective C
CenCheckBox *checkbox = [[CenCheckBox alloc] initWithFrame:NSMakeRect(0, 0, 200, 200)];

// Animation options:
// BEMAnimationTypeFlat
// BEMAnimationTypeFill
// BEMAnimationTypeStroke
// BEMAnimationTypeBounce

checkbox.animator = @"BEMAnimationTypeFlat";
[window.contentView addSubview:checkbox];
```
<br /><br />


<p align="center"> 
<img src="https://github.com/ZHANGneuro/CenCheckbox/blob/master/Screen_Recording.gif">
</p>


bo <br />
2017-06-14
