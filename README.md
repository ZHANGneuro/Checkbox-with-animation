# CenCheckbox

CenCheckBox is modified version of BEMCheckBox for MacOS, since BEMCheckBox is designed for iOS platform only. For the current version, 4 animations are integrated, you can try to add more, I will improve this version when I am free. Hope this repository helps someone who wanted to use BEM-style checkbox on MacOS.<br /><br />

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

3. setting animation after initializing CenCheckBox.
```Objective C
CenCheckBox *checkbox = [[CenCheckBox alloc] initWithFrame:NSMakeRect(0, 0, 200, 200)];
checkbox.animator = @"BEMAnimationTypeFlat";
[window.contentView addSubview:checkbox];
```
<br /><br />


<p align="center"> 
<img src="https://github.com/ZHANGneuro/CenCheckbox/blob/master/Screen_Recording.gif">
</p>

<br /><br />
Cen is beautiful girl with a kind heart and loving soul, I am truly blessed to have a friend like her, I am working hard towrds everything I want, I appreciate and thank God for what I have for the past and future. 
<br /><br />

bo <br />
2017-06-14
