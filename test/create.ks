#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('create', func() {
	it('hsb(60, 100%, 100%)', func() { // {{{
		const c = new Color('hsb(60, 100%, 100%)')

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('hsb, 60, 100, 100', func() { // {{{
		const c = new Color('hsb', 60, 100, 100)

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{h:60, s:100, b:100}', func() { // {{{
		const c = new Color({h:60, s:100, b:100})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{hue:60, saturation:100, brightness:100}', func() { // {{{
		const c = new Color({hue:60, saturation:100, brightness:100})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('hsl(60, 100%, 50%)', func() { // {{{
		const c = new Color('hsl(60, 100%, 50%)')

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('hsl, 60, 100, 50', func() { // {{{
		const c = new Color('hsl', 60, 100, 50)

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{h:60, s:100, l:50}', func() { // {{{
		const c = new Color({h:60, s:100, l:50})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{hue:60, saturation:100, lightness:50}', func() { // {{{
		const c = new Color({hue:60, saturation:100, lightness:50})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('hsi(60, 100%, 170)', func() { // {{{
		const c = new Color('hsi(60, 100%, 170)')

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('hsi, 60, 100, 170', func() { // {{{
		const c = new Color('hsi', 60, 100, 170)

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{h:60, s:100, i:170}', func() { // {{{
		const c = new Color({h:60, s:100, i:170})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{hue:60, saturation:100, intensity:170}', func() { // {{{
		const c = new Color({hue:60, saturation:100, intensity:170})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('hwb(yellow, 0%, 0%)', func() { // {{{
		const c = new Color('hwb(yellow, 0%, 0%)')

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('hwb, yellow, 0, 0', func() { // {{{
		const c = new Color('hwb', 'yellow', 0, 0)

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{h:yellow, w:0, b:0}', func() { // {{{
		const c = new Color({h:'yellow', w:0, b:0})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}

	it('{hue:yellow, whiteness:0, blackness:0}', func() { // {{{
		const c = new Color({hue:'yellow', whiteness:0, blackness:0})

		expect(c.red()).to.equal(255)
		expect(c.green()).to.equal(255)
		expect(c.blue()).to.equal(0)
	}) // }}}
})