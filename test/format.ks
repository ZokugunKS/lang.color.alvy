#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('format', func() {
	describe('hex', func() {
		it('hsl', func() { // {{{
			expect(new Color('#ff0').format('hsl')).to.equal('hsl(60, 100%, 50%)')
		}) // }}}

		it('hsb', func() { // {{{
			expect(new Color('#ff0').format('hsb')).to.equal('hsb(60, 100%, 100%)')
		}) // }}}

		it('hsv', func() { // {{{
			expect(new Color('#ff0').format('hsv')).to.equal('hsv(60, 100%, 100%)')
		}) // }}}

		it('hwb', func() { // {{{
			expect(new Color('#ff0').format('hwb')).to.equal('hwb(60, 0%, 0%)')
		}) // }}}

		it('hsl with alpha', func() { // {{{
			expect(new Color('#ff0d').format('hsl')).to.equal('hsla(60, 100%, 50%, 0.867)')
		}) // }}}

		it('hsb with alpha', func() { // {{{
			expect(new Color('#ff0d').format('hsb')).to.equal('hsba(60, 100%, 100%, 0.867)')
		}) // }}}

		it('hwb with alpha', func() { // {{{
			expect(new Color('#ff0d').format('hwb')).to.equal('hwba(60, 0%, 0%, 0.867)')
		}) // }}}

		it('hsi', func() { // {{{
			expect(new Color('#ff0').format('hsi')).to.equal('hsi(60, 100%, 170)')
		}) // }}}
	})

	describe('hsl', func() {
		it('hex', func() { // {{{
			expect(new Color('hsl(60, 100%, 50%)').format('hex')).to.equal('#ff0')
		}) // }}}

		it('rgb', func() { // {{{
			expect(new Color('hsl(60, 100%, 50%)').format('rgb')).to.equal('rgb(255, 255, 0)')
		}) // }}}

		it('hsl', func() { // {{{
			expect(new Color('hsl(60, 100%, 50%)').format('hsl')).to.equal('hsl(60, 100%, 50%)')
		}) // }}}

		it('hsb', func() { // {{{
			expect(new Color('hsl(60, 100%, 50%)').format('hsb')).to.equal('hsb(60, 100%, 100%)')
		}) // }}}

		it('hwb', func() { // {{{
			expect(new Color('hsl(60, 100%, 50%)').format('hwb')).to.equal('hwb(60, 0%, 0%)')
		}) // }}}
	})

	describe('hsb', func() {
		it('hex', func() { // {{{
			expect(new Color('hsb(60, 100%, 100%)').format('hex')).to.equal('#ff0')
		}) // }}}

		it('rgb', func() { // {{{
			expect(new Color('hsb(60, 100%, 100%)').format('rgb')).to.equal('rgb(255, 255, 0)')
		}) // }}}

		it('hsl', func() { // {{{
			expect(new Color('hsb(60, 100%, 100%)').format('hsl')).to.equal('hsl(60, 100%, 50%)')
		}) // }}}

		it('hsb', func() { // {{{
			expect(new Color('hsb(60, 100%, 100%)').format('hsb')).to.equal('hsb(60, 100%, 100%)')
		}) // }}}

		it('hwb', func() { // {{{
			expect(new Color('hsb(60, 100%, 100%)').format('hwb')).to.equal('hwb(60, 0%, 0%)')
		}) // }}}
	})

	describe('hwb', func() {
		it('hex', func() { // {{{
			expect(new Color('hwb(yellow, 0%, 0%)').format('hex')).to.equal('#ff0')
		}) // }}}

		it('rgb', func() { // {{{
			expect(new Color('hwb(yellow, 0%, 0%)').format('rgb')).to.equal('rgb(255, 255, 0)')
		}) // }}}

		it('hsl', func() { // {{{
			expect(new Color('hwb(yellow, 0%, 0%)').format('hsl')).to.equal('hsl(60, 100%, 50%)')
		}) // }}}

		it('hsb', func() { // {{{
			expect(new Color('hwb(yellow, 0%, 0%)').format('hsb')).to.equal('hsb(60, 100%, 100%)')
		}) // }}}

		it('hwb', func() { // {{{
			expect(new Color('hwb(yellow, 0%, 0%)').format('hwb')).to.equal('hwb(60, 0%, 0%)')
		}) // }}}
	})

	describe('hsi', func() {
		it('hex', func() { // {{{
			expect(new Color('hsi(60, 100%, 170)').format('hex')).to.equal('#ff0')
		}) // }}}

		it('rgb', func() { // {{{
			expect(new Color('hsi(60, 100%, 170)').format('rgb')).to.equal('rgb(255, 255, 0)')
		}) // }}}

		it('hsl', func() { // {{{
			expect(new Color('hsi(60, 100%, 170)').format('hsl')).to.equal('hsl(60, 100%, 50%)')
		}) // }}}

		it('hsb', func() { // {{{
			expect(new Color('hsi(60, 100%, 170)').format('hsb')).to.equal('hsb(60, 100%, 100%)')
		}) // }}}

		it('hwb', func() { // {{{
			expect(new Color('hsi(60, 100%, 170)').format('hwb')).to.equal('hwb(60, 0%, 0%)')
		}) // }}}

		it('hsi', func() { // {{{
			expect(new Color('hsi(60, 100%, 170)').format('hsi')).to.equal('hsi(60, 100%, 170)')
		}) // }}}
	})
})