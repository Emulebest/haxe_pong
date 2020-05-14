package physics;

import components.Sprite;

typedef InitialDirection<T> = {
    dx: T,
    dy: T
}

class DiagonalMovement<T> implements MovementPhysics {
    var dx: T;
    var dy: T;

    public function new(initialDirection: InitialDirection<T>) {
        this.dx = initialDirection.dx;
        this.dy = initialDirection.dy;
    }

    public function invertMovement(): Void {
        var currentDy = cast(dy, Float);
        var negativeDy = -currentDy;
        dy = cast negativeDy;
    }

    public function update(dt: Float, sprite: Sprite): Void {
        sprite.bitmap.x += cast(dx, Float);
        sprite.bitmap.y += cast(dy, Float);
    }

    public function stop(): Void {
        dx = cast 0;
        dy = cast 0;
    }
}