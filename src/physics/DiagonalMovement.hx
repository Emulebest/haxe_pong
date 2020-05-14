package physics;

import components.Sprite;

class DiagonalMovement implements MovementPhysics {
    var dx = 2;
    var dy = 2;

    public function new() {

    }

    public function update(dt: Float, sprite: Sprite): Void {
        sprite.bitmap.x += dx;
        sprite.bitmap.y += dy;
    }

    public function stop(): Void {
        dx = 0;
        dy = 0;
    }
}