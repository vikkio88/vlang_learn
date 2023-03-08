import ui
import gx

const (
	win_width  = 64 * 4 + 25
	win_height = 74
)

fn main() {
	rect := ui.rectangle(
		height: 64
		width: 64
		color: gx.rgb(255, 100, 100)
	)
	window := ui.window(
		width: win_width
		height: win_height
		title: 'Test'
		children: [
			ui.row(
				alignment: .center
				spacing: 5
				margin: ui.Margin{5, 5, 5, 5}
				children: [
					rect,
					ui.rectangle(
						height: 64
						width: 64
						color: gx.rgb(100, 255, 100)
					),
					ui.rectangle(
						height: 64
						width: 64
						color: gx.rgb(100, 100, 255)
					),
					ui.rectangle(
						height: 64
						width: 64
						color: gx.rgb(255, 100, 255)
					),
				]
			),
		]
	)
	ui.run(window)
}
