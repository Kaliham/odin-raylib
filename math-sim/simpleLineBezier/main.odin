package main
import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

screenWidth, screenHeight :: 800, 800
startPoint, endPoint := Spline {
		position = rl.Vector2{30, 30},
	}, Spline {
		position = rl.Vector2{screenWidth - 30, screenHeight - 30},
	}
Spline :: struct {
	position:     rl.Vector2,
	shouldMove:   bool,
	circleRadius: f32,
}
main :: proc() {
	rl.SetConfigFlags({rl.ConfigFlag.MSAA_4X_HINT})
	rl.InitWindow(screenWidth, screenHeight, "math sim")
	rl.SetTargetFPS(120)
	for (!rl.WindowShouldClose()) {
		update()
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		render()
		rl.EndDrawing()
	}
	rl.CloseWindow()
}
update :: proc() {
	handleMovingPoints()
}
render :: proc() {
	drawLineSegment()
}

drawLineSegment :: proc() {
	using rl
	DrawCircleV(startPoint.position, startPoint.circleRadius, BLUE)
	DrawCircleV(endPoint.position, endPoint.circleRadius, BLUE)
	buf := strings.Builder{}
	fmt.sbprintf(&buf, "%v", GetFPS())
	fps := strings.to_cstring(&buf)
	DrawText(fps, screenWidth - 50, 30, 18, YELLOW)
	DrawLineBezier(startPoint.position, endPoint.position, 4, BLUE)
}

handleMovingPoints :: proc() {
	using rl
	mouse := GetMousePosition()
	if (CheckCollisionPointCircle(mouse, startPoint.position, 10) &&
		   IsMouseButtonDown(MouseButton.LEFT)) {startPoint.shouldMove = true}
	if (CheckCollisionPointCircle(mouse, endPoint.position, 10) &&
		   IsMouseButtonDown(MouseButton.LEFT)) {endPoint.shouldMove = true}

	startPoint.circleRadius = 10
	endPoint.circleRadius = 10
	if (startPoint.shouldMove) {
		startPoint.position = mouse
		startPoint.circleRadius = 14
		if (IsMouseButtonReleased(MouseButton.LEFT)) {startPoint.shouldMove = false}
	}
	if (endPoint.shouldMove) {
		endPoint.position = mouse
		endPoint.circleRadius = 14
		if (IsMouseButtonReleased(MouseButton.LEFT)) {endPoint.shouldMove = false}
	}


}
