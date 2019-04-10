Color.registerSpace!({
	name: Space::HSB
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%]/g, '')

				let match
				// hsb(120, 100%, 50%)
				if match ?= /^hs[bv]a?\((\d{1,3}),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSB
					that._hue = $caster.hue(match[1])
					that._saturation = $caster.percentage(match[2])
					that._brightness = $caster.percentage(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hsb(120deg, 100%, 50%)
				else if match ?= /^hs[bv]a?\(([0-9.]+)(deg|grad|rad|turn),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSB
					that._hue = $caster.hue(match[1] + match[2])
					that._saturation = $caster.percentage(match[3])
					that._brightness = $caster.percentage(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
				// hsb(yellow, 100%, 50%)
				else if match ?= /^hs[bv]a?\((red|orange|yellow|green|blue|purple),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSB
					that._hue = $caster.namedHue(match[1])
					that._saturation = $caster.percentage(match[2])
					that._brightness = $caster.percentage(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hsb(yellow green, 100%, 50%)
				else if match ?= /^hs[bv]a?\((red|orange|yellow|green|blue|purple|(?:(?:reddish|orangish|yellowish|greenish|bluish|purplish)(?:\([0-9.]+\%\))?))(red|orange|yellow|green|blue|purple),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSB
					that._hue = $caster.namedHue(match[1], match[2])
					that._saturation = $caster.percentage(match[3])
					that._brightness = $caster.percentage(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
			}
			else if args[0] is Object {
				if args[0].h? && args[0].s? && args[0].b? {
					that._space = Space::HSB
					that._alpha = $caster.alpha(args[0].a)
					that._hue = $caster.hue(args[0].h)
					that._saturation = $caster.percentage(args[0].s)
					that._brightness = $caster.percentage(args[0].b)
					return true
				}
				else if args[0].hue? && args[0].saturation? && args[0].brightness? {
					that._space = Space::HSB
					that._alpha = $caster.alpha(args[0].alpha)
					that._hue = $caster.hue(args[0].hue)
					that._saturation = $caster.percentage(args[0].saturation)
					that._brightness = $caster.percentage(args[0].brightness)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::HSB
			that._hue = $caster.hue(args[0])
			that._saturation = $caster.percentage(args[1])
			that._brightness = $caster.percentage(args[2])
			that._alpha = args.length >= 4 ? $caster.alpha(args[3]) : 1
			return true
		}
	} // }}}
	formatters: {
		[Space::HSB](that) { // {{{
			if that._alpha == 1 {
				return 'hsb(' + that._hue + ', ' + that._saturation + '%, ' + that._brightness + '%)'
			}
			else {
				return 'hsba(' + that._hue + ', ' + that._saturation + '%, ' + that._brightness + '%, ' + that._alpha + ')'
			}
		} // }}}
		hsv(that) { // {{{
			if that._alpha == 1 {
				return 'hsv(' + that._hue + ', ' + that._saturation + '%, ' + that._brightness + '%)'
			}
			else {
				return 'hsva(' + that._hue + ', ' + that._saturation + '%, ' + that._brightness + '%, ' + that._alpha + ')'
			}
		} // }}}
	}
	converters: {
		from: {
			[Space::SRGB](red, green, blue, that) { // {{{
				const r = red / 255
				const g = green / 255
				const b = blue / 255

				const min = Math.min(r, g, b)
				const max = Math.max(r, g, b)
				const delta = max - min
				const v = max

				let h, s

				if max == 0 {
					s = 0
				}
				else {
					s = delta / max
				}

				if delta == 0 {
					h = 0
				}
				else if r == max {
					h = (g - b) / delta
				}
				else if g == max {
					h = 2 + (b - r) / delta
				}
				else {
					h = 4 + (r - g) / delta
				}

				that._hue = Math.round(60 * ((6 + h) % 6))
				that._saturation = Math.round(100 * s)
				that._brightness = Math.round(100 * v)

				return that
			} // }}}
		}
		to: {
			[Space::SRGB](hue, saturation, brightness, that) { // {{{
				const h = hue / 360
				const s = saturation / 100
				const v = brightness / 100

				const i = Math.floor(h * 6)
				const f = h * 6 - i
				const p = v * (1 - s)
				const q = v * (1 - f * s)
				const t = v * (1 - (1 - f) * s)

				let r, g, b
				switch i % 6 {
					0 => {
						r = v
						g = t
						b = p
					}
					1 => {
						r = q
						g = v
						b = p
					}
					2 => {
						r = p
						g = v
						b = t
					}
					3 => {
						r = p
						g = q
						b = v
					}
					4 => {
						r = t
						g = p
						b = v
					}
					5 => {
						r = v
						g = p
						b = q
					}
				}

				that._red = Math.round(r * 255)
				that._green = Math.round(g * 255)
				that._blue = Math.round(b * 255)

				return that
			} // }}}
		}
	},
	components: {
		hue: {
			max: 359
			loop: true
			parser: $caster.hue
		},
		saturation: {
			max: 100
			round: 1
		},
		brightness: {
			max: 100
			round: 1
		}
	}
})