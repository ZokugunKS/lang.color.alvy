#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('property', func() {
	it('hue()', func() { // {{{
		const c = new Color('#ff0')

		expect(c.hue()).to.equal(60)
	}) // }}}

	it('hue(128)', func() { // {{{
		const c = new Color('#ff0').hue(128)

		expect(c.hex()).to.equal('#0f2')
	}) // }}}

	it('hue(orange)', func() { // {{{
		const c = new Color('#ff0').hue('orange')

		expect(c.hex()).to.equal('#ff8000')
	}) // }}}

	it('saturation()', func() { // {{{
		const c = new Color('#ff0')

		expect(c.saturation()).to.equal(100)
	}) // }}}

	it('saturation(50)', func() { // {{{
		const c = new Color('#ff0').saturation(50)

		expect(c.hex()).to.equal('#ffff80')
	}) // }}}

	it('lightness()', func() { // {{{
		const c = new Color('#ff0')

		expect(c.lightness()).to.equal(50)
	}) // }}}

	it('lightness(30)', func() { // {{{
		const c = new Color('#ff0').lightness(30)

		expect(c.hex()).to.equal('#990')
	}) // }}}

	it('brightness()', func() { // {{{
		const c = new Color('#ff0')

		expect(c.brightness()).to.equal(100)
	}) // }}}

	it('brightness(30)', func() { // {{{
		const c = new Color('#ff0').brightness(30)

		expect(c.hex()).to.equal('#4d4d00')
	}) // }}}

	it('whiteness()', func() { // {{{
		const c = new Color('#ff0')

		expect(c.whiteness()).to.equal(0)
	}) // }}}

	it('whiteness(30)', func() { // {{{
		const c = new Color('#ff0').whiteness(30)

		expect(c.hex()).to.equal('#ffff4d')
	}) // }}}

	it('blackness()', func() { // {{{
		const c = new Color('#ff0')

		expect(c.blackness()).to.equal(0)
	}) // }}}

	it('blackness(30)', func() { // {{{
		const c = new Color('#ff0').blackness(30)

		expect(c.hex()).to.equal('#b3b300')
	}) // }}}

	it('intensity()', func() { // {{{
		const c = new Color('#ff0')

		expect(c.intensity()).to.equal(170)
	}) // }}}

	it('intensity(30)', func() { // {{{
		const c = new Color('#ff0').intensity(30)

		expect(c.hex()).to.equal('#2d2d00')
	}) // }}}
})