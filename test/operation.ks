#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('operation', func() {
	it('blend(#ff0, blue, 0.5, hsl)', func() { // {{{
		const c = new Color('#ff0').blend(Color.from('blue'), 0.5, 'hsl')

		expect(c.hex()).to.equal('#00ff80')
	}) // }}}

	it('darken(#abc, 50)', func() { // {{{
		const c = new Color('#abc').darken(50)

		expect(c.hex()).to.equal('#3f464d')
	}) // }}}

	it('darken(#abc, 50%)', func() { // {{{
		const c = new Color('#abc').darken('50%')

		expect(c.hex()).to.equal('#555d66')
	}) // }}}

	it('lighten(#753, 50)', func() { // {{{
		const c = new Color('#753').lighten(50)

		expect(c.hex()).to.equal('#f7b16a')
	}) // }}}

	it('lighten(#753, 50%)', func() { // {{{
		const c = new Color('#753').lighten('50%')

		expect(c.hex()).to.equal('#b4814d')
	}) // }}}

	it('desaturate(#abc, 50)', func() { // {{{
		const c = new Color('#abc').desaturate(50)

		expect(c.hex()).to.equal('#ccc')
	}) // }}}

	it('desaturate(#abc, 50%)', func() { // {{{
		const c = new Color('#abc').desaturate('50%')

		expect(c.hex()).to.equal('#bbc3cc')
	}) // }}}

	it('saturate(#abc, 50)', func() { // {{{
		const c = new Color('#abc').saturate(50)

		expect(c.hex()).to.equal('#4388cc')
	}) // }}}

	it('saturate(#abc, 50%)', func() { // {{{
		const c = new Color('#abc').saturate('50%')

		expect(c.hex()).to.equal('#98b2cc')
	}) // }}}

	it('shift(#abc, 120)', func() { // {{{
		const c = new Color('#abc').shift(120)

		expect(c.hex()).to.equal('#cca9bb')
	}) // }}}

	it('shift(#abc, 50%)', func() { // {{{
		const c = new Color('#abc').shift('50%')

		expect(c.hex()).to.equal('#cca9c3')
	}) // }}}

	it('unshift(#abc, 120)', func() { // {{{
		const c = new Color('#abc').unshift(120)

		expect(c.hex()).to.equal('#bbcca9')
	}) // }}}

	it('unshift(#abc, 50%)', func() { // {{{
		const c = new Color('#abc').unshift('50%')

		expect(c.hex()).to.equal('#b2cca9')
	}) // }}}

	#[error(off)]
	it('space(#abc, hwb)', func() { // {{{
		const c = new Color('#abc')

		expect(c.space()).to.equal('srgb')
		expect(c._whiteness).to.equal(0)

		c.space('hwb')

		expect(c._whiteness).to.equal(67)
	}) // }}}
})