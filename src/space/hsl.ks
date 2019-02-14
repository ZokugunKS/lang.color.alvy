Color.registerSpace!({
	name: Space::HSL
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%]/g, '')

				let match
				// hsl(120, 100%, 50%)
				if match ?= /^hsla?\((\d{1,3}),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = 'hsl'
					that._hue = $caster.hue(match[1])
					that._saturation = $caster.percentage(match[2])
					that._lightness = $caster.percentage(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hsl(120deg, 100%, 50%)
				else if match ?= /^hsla?\(([0-9.]+)(deg|grad|rad|turn),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = 'hsl'
					that._hue = $caster.hue(match[1] + match[2])
					that._saturation = $caster.percentage(match[3])
					that._lightness = $caster.percentage(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
				// hsl(yellow, 100%, 50%)
				else if match ?= /^hsla?\((red|orange|yellow|green|blue|purple),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = 'hsl'
					that._hue = $caster.namedHue(match[1])
					that._saturation = $caster.percentage(match[2])
					that._lightness = $caster.percentage(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hsl(yellow green, 100%, 50%)
				else if match ?= /^hsla?\((red|orange|yellow|green|blue|purple|(?:(?:reddish|orangish|yellowish|greenish|bluish|purplish)(?:\([0-9.]+\%\))?))(red|orange|yellow|green|blue|purple),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = 'hsl'
					that._hue = $caster.namedHue(match[1], match[2])
					that._saturation = $caster.percentage(match[3])
					that._lightness = $caster.percentage(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
			}
			else if args[0] is Object {
				if args[0].h? && args[0].s? && args[0].l? {
					that._space = 'hsl'
					that._alpha = $caster.alpha(args[0].a)
					that._hue = $caster.hue(args[0].h)
					that._saturation = $caster.percentage(args[0].s)
					that._lightness = $caster.percentage(args[0].l)
					return true
				}
				else if args[0].hue? && args[0].saturation? && args[0].lightness? {
					that._space = 'hsl'
					that._alpha = $caster.alpha(args[0].alpha)
					that._hue = $caster.hue(args[0].hue)
					that._saturation = $caster.percentage(args[0].saturation)
					that._lightness = $caster.percentage(args[0].lightness)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = 'hsl'
			that._hue = $caster.hue(args[0])
			that._saturation = $caster.percentage(args[1])
			that._lightness = $caster.percentage(args[2])
			that._alpha = args.length >= 4 ? $caster.alpha(args[3]) : 1
			return true
		}
	}, // }}}
	formatter(that) { // {{{
		if that._alpha == 1 {
			return 'hsl(' + that._hue + ', ' + that._saturation + '%, ' + that._lightness + '%)'
		}
		else {
			return 'hsla(' + that._hue + ', ' + that._saturation + '%, ' + that._lightness + '%, ' + that._alpha + ')'
		}
	} // }}}
	converters: {
		from: {
			srgb(red, green, blue, that) { // {{{
				const r = red / 255
				const g = green / 255
				const b = blue / 255

				const min = Math.min(r, g, b)
				const max = Math.max(r, g, b)
				const delta = max - min
				const l = (max + min) / 2

				let h, s

				if delta == 0 {
					h = 0
					s = 0
				}
				else {
					if r == max {
						h = (g - b) / delta
					}
					else if g == max {
						h = 2 + (b - r) / delta
					}
					else {
						h = 4 + (r - g) / delta
					}

					s = delta / (l < 0.5 ? max + min : 2 - max - min)
				}

				that._hue = $caster.hue(60 * ((6 + h) % 6))
				that._saturation = $caster.percentage(100 * s)
				that._lightness = $caster.percentage(100 * l)

				return that
			} // }}}
		}
		to: {
			srgb(hue, saturation, lightness, that) { // {{{
				const h = hue / 360
				const s = saturation / 100
				const l = lightness / 100

				let val
				if s == 0 {
					that._red = that._green = that._blue = $caster.ff(l * 255)
				}
				else {
					let t1, t2, t3
					if l < 0.5 {
						t2 = l * (1 + s)
					}
					else {
						t2 = l + s - l * s
					}
					t1 = 2 * l - t2

					for i from 0 til 3 {
						t3 = h + 1 / 3 * - (i - 1)

						if t3 < 0 {
							++t3
						}
						else if t3 > 1 {
							--t3
						}

						if 6 * t3 < 1 {
							val = t1 + (t2 - t1) * 6 * t3
						}
						else if 2 * t3 < 1 {
							val = t2
						}
						else if 3 * t3 < 2 {
							val = t1 + (t2 - t1) * (2 / 3 - t3) * 6
						}
						else {
							val = t1
						}

						if i == 0 {
							that._red = $caster.ff(val * 255)
						}
						else if i == 1 {
							that._green = $caster.ff(val * 255)
						}
						else {
							that._blue = $caster.ff(val * 255)
						}
					}
				}

				return that
			} // }}}
		}
	}
	components: {
		hue: {
			family: Space::HSB
		}
		saturation: {
			family: Space::HSB
		}
		lightness: {
			max: 100
			round: 1
		}
	}
})