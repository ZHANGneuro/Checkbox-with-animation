# CenCheckbox

CenCheckBox is modified version of BEMCheckBox for MacOS, since BEMCheckBox is designed for iOS platform only. For the current version, only 1 animation (BEMAnimationTypeFlat) is integrated, you can try add more yourself, I will improve this version when I am free. Hope this repository can help someone who wanted to use BEM-style checkbox on MacOS.<br /><br />


![alt tag](https://github.com/ZHANGneuro/CenCheckbox/blob/master/Screenshot.png)
<br /><br />

## Setup
1. Import ```"CenCheckBox.h"```
```Objective C
#import "CenCheckBox.h"
```


2. Initializing "CenCheckBox" and add it to a NSView. 
```Objective C
checkbox = [[CenCheckBox alloc] initWithFrame:NSMakeRect(0, 0, 200, 200)];
[window.contentView addSubview:checkbox];
```

![alt tag](https://github.com/ZHANGneuro/CenCheckbox/blob/master/Screen%20Recording.gif)


<br /><br /><br />
bo <br />
2017-06-14
