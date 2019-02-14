extern {
	func parseFloat(...): Number
	func parseInt(...): Number
}

import '@zokugun/lang'
import '@zokugun/lang.color'

enum Space {
	HSB
	HSL
	HSI
	HWB
}

include {
	'./util.ks'

	'./space/hsb.ks'
	'./space/hsl.ks'
	'./space/hsi.ks'
	'./space/hwb.ks'
}

impl Color {
	#[error(off)]
	darken(value: Number | String) { // {{{
		this.space('brightness')

		if value is String && value:String.endsWith('%') {
			return this.brightness(this._brightness * ((100 - value:String.toFloat()) / 100))
		}
		else {
			return this.brightness(this._brightness - value.toFloat())
		}
	} // }}}
	#[error(off)]
	desaturate(value: Number | String) { // {{{
		this.space('saturation')

		if value is String && value:String.endsWith('%') {
			return this.saturation(this._saturation * ((100 - value:String.toFloat()) / 100))
		}
		else {
			return this.saturation(this._saturation - value.toFloat())
		}
	} // }}}
	#[error(off)]
	lighten(value: Number | String) { // {{{
		this.space('brightness')

		if value is String && value:String.endsWith('%') {
			return this.brightness(this._brightness * ((100 + value:String.toFloat()) / 100))
		}
		else {
			return this.brightness(this._brightness + value.toFloat())
		}
	} // }}}
	#[error(off)]
	saturate(value: Number | String) { // {{{
		this.space('saturation')

		if value is String && value:String.endsWith('%') {
			return this.saturation(this._saturation * ((100 + value:String.toFloat()) / 100))
		}
		else {
			return this.saturation(this._saturation + value.toFloat())
		}
	} // }}}
	#[error(off)]
	shift(value: Number | String) { // {{{
		this.space('hue')

		if value is String && value:String.endsWith('%') {
			return this.hue(this._hue * ((100 + value:String.toFloat()) / 100))
		}
		else {
			return this.hue(this._hue + value.toFloat())
		}
	} // }}}
	#[error(off)]
	unshift(value: Number | String) { // {{{
		this.space('hue')

		if value is String && value:String.endsWith('%') {
			return this.hue(this._hue * ((100 - value:String.toFloat()) / 100))
		}
		else {
			return this.hue(this._hue - value.toFloat())
		}
	} // }}}
}

export Color, Space