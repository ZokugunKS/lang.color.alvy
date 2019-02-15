[@zokugun/lang.color.alvy](https://github.com/ZokugunKS/lang.color.alvy)
==============================================================

[![kaoscript](https://img.shields.io/badge/language-kaoscript-orange.svg)](https://github.com/kaoscript/kaoscript)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)
[![NPM Version](https://img.shields.io/npm/v/@zokugun/lang.color.alvy.svg?colorB=green)](https://www.npmjs.com/package/@zokugun/lang.color.alvy)
[![Dependency Status](https://badges.depfu.com/badges/09e68dbdaf54324daebb74822a3356d6/overview.svg)](https://depfu.com/github/zokugun/lang.color.alvy)
[![Build Status](https://travis-ci.org/ZokugunKS/lang.color.alvy.svg?branch=master)](https://travis-ci.org/ZokugunKS/lang.color.alvy)
[![CircleCI](https://circleci.com/gh/ZokugunKS/lang.color.alvy/tree/master.svg?style=shield)](https://circleci.com/gh/ZokugunKS/lang.color.alvy/tree/master)
[![Coverage Status](https://img.shields.io/coveralls/ZokugunKS/lang.color.alvy/master.svg)](https://coveralls.io/github/ZokugunKS/lang.color.alvy)

Provides HSV/HSB, HSV, HWB and HSI spaces.

Getting Started
---------------

With [node](http://nodejs.org) previously installed:

	npm install @zokugun/lang.color.alvy

Use it with `JavaScript`:

```javascript
require('kaoscript/register');

const { Color, Space } = require('@zokugun/lang.color.alvy')();

const c = new Color('hsl(90, 100%, 50%)');
```

Use it with `kaoscript`:
```kaoscript
import '@zokugun/lang.color.alvy'

const c = new Color('hsl(90, 100%, 50%)')
```

Methods
-------

### Properties

A color is defined in a color space. If you try to access it into another space, the color will be automatically converted into the new space.

#### hsl

* `hue()`: *Number*
* `hue(Number)`: *Color*
* `saturation()`: *Number*
* `saturation(Number)`: *Color*
* `lightness()`: *Number*
* `lightness(Number)`: *Color*

#### hsi

* `hue()`: *Number*
* `hue(Number)`: *Color*
* `saturation()`: *Number*
* `saturation(Number)`: *Color*
* `intensity()`: *Number*
* `intensity(Number)`: *Color*

#### hsb/hsv

* `hue()`: *Number*
* `hue(Number)`: *Color*
* `saturation()`: *Number*
* `saturation(Number)`: *Color*
* `brightness()`: *Number*
* `brightness(Number)`: *Color*

#### hwb

* `hue()`: *Number*
* `hue(Number)`: *Color*
* `whiteness()`: *Number*
* `whiteness(Number)`: *Color*
* `blackness()`: *Number*
* `blackness(Number)`: *Color*

### Transformers

* `darken(Number)`: *Color*
* `lighten(Number)`: *Color*
* `desaturate(Number)`: *Color*
* `shift(Number)`: *Color*
* `unshift(Number)`: *Color*

Syntax
------

### hsl
```
hsla?(hue, saturation, lightness, alpha?)

hue: from 0 to 100, no decimal
saturation: from 0 to 100, up to 1 decimal place
lightness: from 0 to 100, up to 1 decimal place
alpha: from 0 to 1, up to 3 decimal places

hsl(60, 100%, 50%)
hsl(100grad, 100%, 50%)
hsl(yellow, 100%, 50%)
```

### hsi
```
hsia?(hue, saturation, intensity, alpha?)

hue: from 0 to 100, no decimal
saturation: from 0 to 100, up to 1 decimal place
intensity: from 0 to 255, no decimal
alpha: from 0 to 1, up to 3 decimal places
```

### hsb
```
hsba?(hue, saturation, brightness, alpha?)

hue: from 0 to 100, no decimal
saturation: from 0 to 100, up to 1 decimal place
brightness: from 0 to 100, up to 1 decimal place
alpha: from 0 to 1, up to 3 decimal places
```

### hwb
```
hwba?(hue, whiteness, blackness, alpha?)

hue: from 0 to 100, no decimal
whiteness: from 0 to 100, up to 1 decimal place
blackness: from 0 to 100, up to 1 decimal place
alpha: from 0 to 1, up to 3 decimal places
```

License
-------

[MIT](http://www.opensource.org/licenses/mit-license.php) &copy; Baptiste Augrain
