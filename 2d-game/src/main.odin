package main
import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(width = 1280, height = 720, title = "Hellp")
	defer rl.CloseWindow()
	init()
	for (!rl.WindowShouldClose()) {
		rl.BeginDrawing()
		update()
		render()
		rl.EndDrawing()
	}
}

init :: proc() {


}

update :: proc() {

}

render :: proc() {
	using rl
	ClearBackground(BLACK)
}
